if data.raw["recipe"]["red-wire"] and data.raw["recipe"]["green-wire"] then
	data.raw["recipe"]["red-wire"].hidden = true
	data.raw["recipe"]["red-wire"].enabled = false
	data.raw["recipe"]["green-wire"].hidden = true
	data.raw["recipe"]["green-wire"].enabled = false
end

if data.raw["item"]["red-wire"] and data.raw["item"]["green-wire"] then
	data.raw["item"]["red-wire"].flags = { "hidden" }
	data.raw["item"]["green-wire"].flags = { "hidden" }
end

if data.raw["technology"]["circuit-network"] then
	local tech_effects = data.raw["technology"]["circuit-network"].effects
	for i = (#tech_effects), 1, -1 do
		if tech_effects[i].type == "unlock-recipe" then
			if tech_effects[i].recipe == "red-wire" or tech_effects[i].recipe == "green-wire" then
				table.remove(tech_effects, i)
			end
		end
	end
end

for _, recipe in pairs(data.raw["recipe"]) do
	if recipe.ingredients then
		local ingredients = recipe.ingredients
		for i = (#ingredients), 1, -1 do
			if ingredients[i] then
				if ingredients[i][1] == "green-wire" or
					ingredients[i][1] == "red-wire" or
						ingredients[i].name and (ingredients[i].name == "green-wire" or ingredients[i].name == "red-wire") then
					table.remove(ingredients, i)
				end
			end
		end
	end
end