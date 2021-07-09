## Let the wires (as items) go!

Are you tired of red and green wires cluttering your inventory and having to bother to provide them even though they're basically free? You get them actually for free in blueprints, and they have only a symbolic cost otherwise. This mod removes the wires as craftable items and makes them available from shortcuts, similar to how blueprints etc. work now. The wire stack you get is ephemeral and exists only as long as you hold it on your cursor, as soon as you release it, it disappears. In addition to the shortcut buttons, the mod includes hotkeys to pick up red (Alt + F) and green (Alt + G) wires and to switch the current wire color (Ctrl + Tab).  

#### Surrogate wire

The red and green wires are removed from all recipes where they appear (none in vanilla, but  happens in mods, e.g. LTN). Optionally, very much NOT recommended, instead of removing them, the wires in recipes can be replaced with identical substitutes. The substitutes will reflect the changes to the recipes of the wires themselves, if any. But really, you should just let the wires go! 

#### Copper wire

The mod includes a shortcut and a hotkey (Alt + C) to pick up copper cable. If available, a stack of copper wire is taken from the inventory, otherwise it gives one (1) copper wire to prevent abuse. You can still trick the system and abuse it, but you'll have to work for it.

#### Shortcut availability

Technically, shortcuts are a "new game plus" feature, as in, you unlock them once by researching a particular technology and they stay available forever. If a shortcut, from this mod or otherwise, is not unlocked for any reason, overhaul mods and such, you can make all shotcuts available with the console command `/unlock-shortcut-bar`. This command does NOT disable achievements.

## Wire cutter

A new feature in the mod as of version 1.1.1 is the wire cutter tool to quickly remove all connections in an area. The wire cutter has a shortcut button and a hotkey (Alt + X). Please, remember, that you can disable unwanted shortcuts and remap hotkeys.

The wire cutter is a selection tool, similar to e.g. the deconstruction planner. As other selection tools, it has primary and alternative selections. With default controls, the primary selection is done with the left mouse button, and the alternative with Shift + left mouse button. The color of the selection box indicates what type(s) of wire are to be cut. Red and green together are indicated as blue, because the logical color (yellow) indicates copper cable.  

By default, the wire cutter operates in the simple universal mode (black-yellow icon). Its primary selection removes all red and green wire connections from all selected entities. The alternative selection removes all copper cable connections. The same as the wires in this mod, the wire cutter tool is ephemeral and exists only while held, you can't store it anywhere. 

CAUTION. At this time the wire cutter tool has NO UNDO! Cut responsibly! 

#### Multi-mode wire cutter

If you want finer control than the universal mode described above, you can enable multi-mode operation for the wire cutter. It's a runtime setting, so no need to restart the game, and it's also a per player setting, so in multiplayer each player should be able to change it independently.  

In multi-mode the wire cutter has four modes: universal (black-yellow icon), copper (yellow-black icon), red (red-green icon), and green (green-red icon): 

* The universal mode works as described above. 
* The copper mode is the reverse of the universal. The primary selection removes copper cable connection, the alternative - red and green wire connections. 
* In the red mode the primary selection removes all red wire connections, and the alternative - all green wire connections. 
* The green mode is the reverse of the red. 

To avoid clutter, there is still only one wire cutter shortcut and hotkey, and they always set the wire cutter to the universal mode. The wire shortcuts and hotkeys are repurposed to switch the mode of the wire cutter while one is being held in the cursor. Each shortcut sets the wire cutter to the corresponding mode, i.e. the "give red wire" shortcut/hotkey switches the currently held wire cutter to the red mode, etc. If the wire cutter is in red or green mode, the "switch wire color" hotkey switches the color of the wire cutter. Remember, that all of this is only applicable if the multi-mode operation is selected, otherwise wire shortcuts have no effect on the wire cutter.   

#### Limitations and compatibility

It has been reported that a Space Exploration mod entity Cargo Rocket Silo uses hidden wire connection for its operation. Therefore to not break its function, the wire cutter tool will not cut connections FROM Cargo Rocket Silos. Include all connected entities in the selection to disconnect a Cargo Rocket Silo. 