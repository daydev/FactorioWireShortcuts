local players = game.players
for i = 1, (#players) do
    local inv = players[i].get_main_inventory()
    if inv and inv.valid then
        inv.remove("red-wire")
        inv.remove("green-wire")
    end
end

