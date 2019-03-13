local players = game.players
for i = 1, (#players) do
	local inv = players[i].get_inventory(defines.inventory.player_main)
	if inv and inv.valid then
		inv.remove("red-wire")
		inv.remove("green-wire")
	end
end
