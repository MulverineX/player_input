# Player Input
Player Input is a library specifically designed for handling polling based input detection, made possible by the type specific `input` field on players that gives us 20hz access to the keybinds `forward`, `backward`, `left`, `right`, `jump`, `sneak`, `sprint` at all times, in all game modes, regardless of context, except within GUIs.

The goal of this library is two fold:

1. Optimize actionable retrieval of this data; many packs need this data but its worse for performance for all of them to be polling at the same time.
2. Create easy & useful DX for tracking and acting on changes in this data.

### Usage

Packs that need access to this input data for few out of many players in specific scenarios should use the `capture/player` path to begin tracking of the data.

Packs that need access to input data for most/all of players should use the `capture/players` path to begin tracking of the data, and call the `release/players` when the data is no longer needed (use `#minecraft:unload` if the data is needed all of the time)

When data is being received, the exclusive `player_input.*` `/tag` labels are always made available.

Packs that need to do their own custom tracking every tick regardless of if the binds change can use the `raw` entrypoint. If only some players need to be checked use the `#player_input:player/raw` function tag (called as/at each player) and use your own `/tag` label to filter players your pack is operating with as the function tag will be called for all usage of the library.

Events: 

These entrypoints are called as/at players that match the required state along with context data made available to functions in each tag, enabling event-based handling, instead of checking for state every tick.

To subscribe to any of these, call the appropriate capture function, then to clean up after usage, call the release function.

As with `raw`, make sure to `/tag` players that your pack is specifically handling, as the function tag will be called for all usage of the library.

- `key_update` - Called as/at players whose input stack has changed from the previous tick.
    - Tracked via the exclusive `player_input.previous.*` `/tag` labels and the `player_input.current_tick`/`player_input.previous_tick` composite Scores on the player.
    - This context is also available for the following events.
- `key_down` - Called as/at players that **were not** holding down any given key(s) in the previous tick and started to.
    - Tracked via the exclusive `player_input.down.*` `/tag` labels and the `keys_down player_input.current_tick` composite Score during execution.
- `key_up` - Called as/at players that **were** holding down any given key(s) in the previous tick and released them.
    - Tracked via the exclusive `player_input.up.*` `/tag` labels and the `keys_up player_input.current_tick` composite Score during execution.

### Example

`jetpack:jetpack/equip`
```mcfunction
tag @s add jetpack.equipped

function player_input:capture/player/key_update

# Jetpack Things...
```

`jetpack:input_received`
```mcfunction
execute if entity @s[tag=jetpack.equipped] run function jetpack:jetpack/control
```

`jetpack:jetpack/control`
```mcfunction
# Handle changes to player input
```

`jetpack:jetpack/unequipped`
```mcfunction
tag @s remove jetpack.equipped

function player_input:release/player/key_update

# Jetpack Things...
```

`#player_input:player/key_update`
```json
{
    "values": [
        "jetpack:input_received"
    ],
    "replace": false
}
```

### Plans
- Create a couple full proof-of-concept survival packs using this library and Player Motion.
- Reimplement in the Sandstone official `player` library
- Create a vanilla usage harness and deploy it to this repo
- Archive the current manually written vanilla code, automatically publish generated code to this repository.
- Port proof-of-concept packs to Sandstone. 
- Maintain for changes in minecraft updates.