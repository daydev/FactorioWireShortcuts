local colored_tech_unlock = "circuit-network"
local copper_tech_unlock
if mods["IndustrialRevolution"] then
    copper_tech_unlock = "deadlock-steam-power"
else
    copper_tech_unlock = "electronics"
end

data:extend(
{
  {
      type = "shortcut",
      name = "WireShortcuts-give-red",
      order = "w[wire]-r[red-wire]",
      action = "lua",
      associated_control_input = "WireShortcuts-give-red",
      localised_name = {"shortcut.WireShortcuts-give-red"},
      technology_to_unlock = colored_tech_unlock,
      icon =
      {
        filename = "__WireShortcuts__/graphics/icons/red-wire-x32.png",
        priority = "extra-high-no-scale",
        size = 32,
        scale = 1,
        flags = {"icon"}
      },
      disabled_icon =
      {
        filename = "__WireShortcuts__/graphics/icons/white-wire-x32.png",
        priority = "extra-high-no-scale",
        size = 32,
        scale = 1,
        flags = {"icon"}
      },
      small_icon =
      {
        filename = "__WireShortcuts__/graphics/icons/red-wire-x24.png",
        priority = "extra-high-no-scale",
        size = 24,
        scale = 1,
        flags = {"icon"}
      },
      disabled_small_icon =
      {
        filename = "__WireShortcuts__/graphics/icons/white-wire-x24.png",
        priority = "extra-high-no-scale",
        size = 24,
        scale = 1,
        flags = {"icon"}
      }
  },
  {
      type = "shortcut",
      name = "WireShortcuts-give-green",
      order = "w[wire]-g[green-wire]",
      action = "lua",
      associated_control_input = "WireShortcuts-give-green",
      localised_name = {"shortcut.WireShortcuts-give-green"},
      technology_to_unlock = colored_tech_unlock,
      icon =
      {
        filename = "__WireShortcuts__/graphics/icons/green-wire-x32.png",
        priority = "extra-high-no-scale",
        size = 32,
        scale = 1,
        flags = {"icon"}
      },
      disabled_icon =
      {
        filename = "__WireShortcuts__/graphics/icons/white-wire-x32.png",
        priority = "extra-high-no-scale",
        size = 32,
        scale = 1,
        flags = {"icon"}
      },
      small_icon =
      {
        filename = "__WireShortcuts__/graphics/icons/green-wire-x24.png",
        priority = "extra-high-no-scale",
        size = 24,
        scale = 1,
        flags = {"icon"}
      },
      disabled_small_icon =
      {
        filename = "__WireShortcuts__/graphics/icons/white-wire-x24.png",
        priority = "extra-high-no-scale",
        size = 24,
        scale = 1,
        flags = {"icon"}
      }
  },
  {
      type = "shortcut",
      name = "WireShortcuts-give-copper",
      order = "w[wire]-c[copper-wire]",
      action = "lua",
      associated_control_input = "WireShortcuts-give-copper",
      localised_name = {"shortcut.WireShortcuts-give-copper"},
      technology_to_unlock = copper_tech_unlock,
      icon =
      {
        filename = "__WireShortcuts__/graphics/icons/copper-wire-x32.png",
        priority = "extra-high-no-scale",
        size = 32,
        scale = 1,
        flags = {"icon"}
      },
      disabled_icon =
      {
        filename = "__WireShortcuts__/graphics/icons/white-wire-x32.png",
        priority = "extra-high-no-scale",
        size = 32,
        scale = 1,
        flags = {"icon"}
      },
      small_icon =
      {
        filename = "__WireShortcuts__/graphics/icons/copper-wire-x24.png",
        priority = "extra-high-no-scale",
        size = 24,
        scale = 1,
        flags = {"icon"}
      },
      disabled_small_icon =
      {
        filename = "__WireShortcuts__/graphics/icons/white-wire-x24.png",
        priority = "extra-high-no-scale",
        size = 24,
        scale = 1,
        flags = {"icon"}
      }
  },
  {
    type = "shortcut",
    name = "WireShortcuts-give-cutter",
    order = "w[wire]-c[cutter]",
    action = "lua",
    associated_control_input = "WireShortcuts-give-cutter",
    localised_name = {"shortcut.WireShortcuts-give-cutter"},
    technology_to_unlock = colored_tech_unlock,
    icon =
    {
      filename = "__WireShortcuts__/graphics/icons/wire-cutter-x32.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"gui-icon"}
    },
    disabled_icon =
    {
      filename = "__WireShortcuts__/graphics/icons/wire-cutter-white-x32.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"gui-icon"}
    },
    small_icon =
    {
      filename = "__WireShortcuts__/graphics/icons/wire-cutter-x24.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 1,
      flags = {"gui-icon"}
    },
    disabled_small_icon =
    {
      filename = "__WireShortcuts__/graphics/icons/wire-cutter-white-x24.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 1,
      flags = {"gui-icon"}
    }
},
})