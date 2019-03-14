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
	player.clean_cursor()
	player.cursor_stack.set_stack({name = wire_type, count = 200})
end

function give_copper(player_index)
	local player = game.players[player_index]
	player.clean_cursor()
	local inv = game.players[player_index].get_main_inventory()
	if inv and inv.valid then
		local wire = inv.find_item_stack("copper-cable")
		if wire then
			player.cursor_stack.swap_stack(wire)
		else 
			player.cursor_stack.set_stack({name = "copper-cable", count = 1})
		end
	end
end

function switch_wire(player_index) 
	local player = game.players[player_index]
	if player.cursor_stack.valid_for_read then
		if player.cursor_stack.name == "red-wire" then
			give_wire(player_index, "green-wire")
		elseif player.cursor_stack.name == "green-wire" then
			give_wire(player_index, "red-wire")
		end
	end
end

local function remove_wire(event)
	local inv = game.players[event.player_index].get_main_inventory()
	if inv and inv.valid then
		inv.remove("red-wire")
		inv.remove("green-wire")
	end
end

script.on_event(defines.events.on_lua_shortcut, handle_shortcut)
script.on_event(defines.events.on_player_main_inventory_changed, remove_wire)

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

