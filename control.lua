

function handle_shortcut(event, input_name)
    local event_name = event.prototype_name or input_name
    local player_id = event.player_index
    if is_cutter_event(event_name, player_id) then
        handle_cutter(event_name, player_id)
    else
        handle_wire(event_name, player_id)
    end
end

function is_cutter_event(event_name, player_id)
    if event_name == "WireShortcuts-give-cutter" then 
        return true 
    else 
        local player = game.players[player_id]
        if player.cursor_stack.valid_for_read and
                string.sub(player.cursor_stack.name, 1, 11) == "wire-cutter" then
            return true
        else 
            return false
        end
    end
end

function handle_wire(event_name, player_id)
    if event_name == "WireShortcuts-give-red" then
        give_wire(player_id, "red-wire")
    elseif event_name == "WireShortcuts-give-green" then
        give_wire(player_id, "green-wire")
    elseif event_name == "WireShortcuts-give-copper" then
        give_copper(player_id)
    end
end

function handle_cutter(event_name, player_id)
    if event_name == "WireShortcuts-give-cutter" then
        give_cutter(player_id, "universal")
    else
        local advanced_mode = settings.get_player_settings(game.get_player(player_id))["wire-shortcuts-is-advanced-cutter"].value
        if not advanced_mode then
            handle_wire(event_name, player_id)
        elseif event_name == "WireShortcuts-give-red" then
            give_cutter(player_id, "red")
        elseif event_name == "WireShortcuts-give-green" then
            give_cutter(player_id, "green")
        elseif event_name == "WireShortcuts-give-copper" then
            give_cutter(player_id, "copper")
        end
    end
end

function give_cutter(player_index, kind)
    local player = game.players[player_index]
    if player.render_mode == defines.render_mode.game then
        if player.clear_cursor() then
            player.cursor_stack.set_stack({ name = "wire-cutter-" .. kind, count = 1 })
        end
    else
        player.print({ "message.no-map-mode" })
    end
end

function give_wire(player_index, wire_type)
    local player = game.players[player_index]
    if player.render_mode == defines.render_mode.game then
        if player.clear_cursor() then
            player.cursor_stack.set_stack({ name = wire_type, count = 200 })
        end
    else
        player.print({ "message.no-map-mode" })
    end
end

function give_copper(player_index)
    local player = game.players[player_index]
    if player.render_mode == defines.render_mode.game then

        local inv = game.players[player_index].get_main_inventory()
        if inv and inv.valid then
            local wire = inv.find_item_stack("copper-cable")
            if wire then
                player.cursor_stack.swap_stack(wire)
            elseif player.clear_cursor() then
                player.cursor_stack.set_stack({ name = "copper-cable", count = 1 })
            end
        end
    else
        player.print({ "message.no-map-mode" })
    end
end

function switch_wire(player_index)
    local player = game.players[player_index]
    if player.render_mode == defines.render_mode.game then
        if player.cursor_stack.valid_for_read then
            if player.cursor_stack.name == "red-wire" then
                give_wire(player_index, "green-wire")
            elseif player.cursor_stack.name == "green-wire" then
                give_wire(player_index, "red-wire")
            elseif player.cursor_stack.name == "wire-cutter-red" then
                give_cutter(player_index, "green")
            elseif player.cursor_stack.name == "wire-cutter-green" then
                give_cutter(player_index, "red")
            end
        end
    else
        player.print({ "message.no-map-mode" })
    end
end

function handle_disconnect(event, alt)
    if string.sub(event.item, 1, 11) == "wire-cutter" then
        disconnect_mode = string.sub(event.item, 13, #event.item)
        for _, entity in ipairs(event.entities) do
            if entity.valid then
                if not alt and disconnect_mode == "copper" or alt and disconnect_mode == "universal" then
                    entity.disconnect_neighbour()
                elseif not alt and disconnect_mode == "red" or alt and disconnect_mode == "green" then
                    entity.disconnect_neighbour(defines.wire_type.red)
                elseif not alt and disconnect_mode == "green" or alt and disconnect_mode == "red" then
                    entity.disconnect_neighbour(defines.wire_type.green)
                elseif disconnect_mode == "universal" or alt and disconnect_mode == "copper" then
                    entity.disconnect_neighbour(defines.wire_type.red)
                    entity.disconnect_neighbour(defines.wire_type.green)
                end
            end
        end
    end
end

script.on_event(defines.events.on_lua_shortcut,
                handle_shortcut) 

script.on_event(defines.events.on_player_selected_area, function(event)
    handle_disconnect(event, false)
end)

script.on_event(defines.events.on_player_alt_selected_area, function(event)
    handle_disconnect(event, true)
end)

script.on_event("WireShortcuts-give-red", function(event)
    handle_shortcut(event, "WireShortcuts-give-red")
end)

script.on_event("WireShortcuts-give-green", function(event)
    handle_shortcut(event, "WireShortcuts-give-green")
end)

script.on_event("WireShortcuts-give-copper", function(event)
    handle_shortcut(event, "WireShortcuts-give-copper")
end)

script.on_event("WireShortcuts-switch-wire", function(event)
    switch_wire(event.player_index)
end)

script.on_event("WireShortcuts-give-cutter", function(event)
    handle_shortcut(event, "WireShortcuts-give-cutter")
end)

