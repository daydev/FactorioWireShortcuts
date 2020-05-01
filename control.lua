function handle_shortcut(event)
    if event.prototype_name == "WireShortcuts-give-red" then
        give_wire(event.player_index, "red-wire")
    elseif event.prototype_name == "WireShortcuts-give-green" then
        give_wire(event.player_index, "green-wire")
    elseif event.prototype_name == "WireShortcuts-give-copper" then
        give_copper(event.player_index)
    end
end

function give_wire(player_index, wire_type)
    local player = game.players[player_index]
    if player.render_mode == defines.render_mode.game then
        if clear_cursor_discard_wire(player) then
            player.cursor_stack.set_stack({ name = wire_type, count = 200 })
        else
            player.print({ "message.cannot-clean-cursor" })
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
            elseif clear_cursor_discard_wire(player) then
                player.cursor_stack.set_stack({ name = "copper-cable", count = 1 })
            else
                player.print({ "message.cannot-clean-cursor" })
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
            end
        end
    else
        player.print({ "message.no-map-mode" })
    end
end

function clear_cursor_discard_wire(player)
    if player.cursor_stack.valid_for_read then
        return (player.cursor_stack.name == "red-wire" or player.cursor_stack.name == "green-wire" or player.clean_cursor())
    else
        return player.clean_cursor()
    end
end

local function remove_wire_inventory(event)
    local inv = game.players[event.player_index].get_main_inventory()
    if inv and inv.valid then
        inv.remove("red-wire")
        inv.remove("green-wire")
    end
end

local function remove_wire_trash(event)
    local inv_trash = game.players[event.player_index].get_inventory(defines.inventory.character_trash)
    if inv_trash and inv_trash.valid then
        inv_trash.remove("red-wire")
        inv_trash.remove("green-wire")
    end
end

local function remove_wire_ground(event)
    local item_on_ground = event.entity
    if item_on_ground and item_on_ground.valid and item_on_ground.stack then
        local item_name = item_on_ground.stack.name
        if item_name == "red-wire" or item_name == "green-wire" then
            item_on_ground.destroy()
        end
    end
end

script.on_event(defines.events.on_lua_shortcut, handle_shortcut)
script.on_event(defines.events.on_player_main_inventory_changed, remove_wire_inventory)
script.on_event(defines.events.on_player_trash_inventory_changed, remove_wire_trash)
script.on_event(defines.events.on_player_dropped_item, remove_wire_ground)

script.on_event("WireShortcuts-give-red", function(event)
    give_wire(event.player_index, "red-wire")
end)

script.on_event("WireShortcuts-give-green", function(event)
    give_wire(event.player_index, "green-wire")
end)

script.on_event("WireShortcuts-give-copper", function(event)
    give_copper(event.player_index)
end)

script.on_event("WireShortcuts-switch-wire", function(event)
    switch_wire(event.player_index)
end)

