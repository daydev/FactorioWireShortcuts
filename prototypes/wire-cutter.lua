local electric_wireable = {
    "electric-pole",
    "power-switch"
}
local circuit_wireable = {
    "arithmetic-combinator",
    "constant-combinator",
    "decider-combinator",
    "programmable-speaker",
    "power-switch",
    "electric-pole",
    "accumulator",
    "container",
    "inserter",
    "lamp",
    "logistic-container",
    "mining-drill",
    "offshore-pump",
    "pump",
    "rail-chain-signal",
    "rail-signal",
    "roboport",
    "storage-tank",
    "train-stop",
    "transport-belt",
    "wall"
}

data:extend(
        {
            {
                type = "selection-tool",
                name = "wire-cutter-universal",
                icon = "__WireShortcuts__/graphics/icons/wire-cutter-universal.png",
                icon_size = 64,
                flags = {"only-in-cursor", "hidden", "spawnable", "not-stackable"},
                stack_size = 1,
                stackable = false,
                selection_color = { b = 1 },
                selection_mode = {"buildable-type", "same-force"},
                alt_selection_color = { r = 1, g = 1 },
                alt_selection_mode = {"buildable-type", "same-force"},
                selection_cursor_box_type = "not-allowed",
                alt_selection_cursor_box_type = "not-allowed",
                entity_type_filters = circuit_wireable,
                alt_entity_type_filters = electric_wireable
            },
            {
                type = "selection-tool",
                name = "wire-cutter-red",
                icon = "__WireShortcuts__/graphics/icons/wire-cutter-red.png",
                icon_size = 64,
                flags = {"only-in-cursor", "hidden", "spawnable", "not-stackable"},
                stack_size = 1,
                stackable = false,
                selection_color = { r = 1 },
                selection_mode = {"buildable-type", "same-force"},
                alt_selection_color = { g = 1 },
                alt_selection_mode = {"buildable-type", "same-force"},
                selection_cursor_box_type = "not-allowed",
                alt_selection_cursor_box_type = "not-allowed",
                entity_type_filters = circuit_wireable,
                alt_entity_type_filters = circuit_wireable
            },
            {
                type = "selection-tool",
                name = "wire-cutter-green",
                icon = "__WireShortcuts__/graphics/icons/wire-cutter-green.png",
                icon_size = 64,
                flags = {"only-in-cursor", "hidden", "spawnable", "not-stackable"},
                stack_size = 1,
                stackable = false,
                selection_color = { g = 1 },
                selection_mode = {"buildable-type", "same-force"},
                alt_selection_color = { r = 1 },
                alt_selection_mode = {"buildable-type", "same-force"},
                selection_cursor_box_type = "not-allowed",
                alt_selection_cursor_box_type = "not-allowed",
                entity_type_filters = circuit_wireable,
                alt_entity_type_filters = circuit_wireable
            },
            {
                type = "selection-tool",
                name = "wire-cutter-copper",
                icon = "__WireShortcuts__/graphics/icons/wire-cutter-copper.png",
                icon_size = 64,
                flags = {"only-in-cursor", "hidden", "spawnable", "not-stackable"},
                stack_size = 1,
                stackable = false,
                selection_color = { r = 1, g = 1 },
                selection_mode = {"buildable-type", "same-force"},
                alt_selection_color = { b = 1 },
                alt_selection_mode = {"buildable-type", "same-force"},
                selection_cursor_box_type = "not-allowed",
                alt_selection_cursor_box_type = "not-allowed",
                entity_type_filters = electric_wireable,
                alt_entity_type_filters = circuit_wireable
            } 

        })