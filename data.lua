require("prototypes.input")
require("prototypes.shortcut")

if settings.startup["wire-shortcuts-is-retain-wire-crafting"].value then
    require("prototypes.fake-item")
    require("prototypes.fake-recipe")
end