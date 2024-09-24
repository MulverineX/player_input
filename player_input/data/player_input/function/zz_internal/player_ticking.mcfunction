execute \
    unless score player player_input.listeners matches 0 \
    unless score player_bulk player_input.listeners matches 1 \
    unless score players player_input.listeners matches 1.. run \
    schedule function player_input:zz_internal/player_ticking 1t replace

execute if score player_tracking player_input.listeners matches 1.. run function player_input:zz_internal/player_tracking

# Scoping these isn't really an optimization.
tag @a remove player_input.forward
tag @a remove player_input.backward
tag @a remove player_input.left
tag @a remove player_input.right
tag @a remove player_input.jump
tag @a remove player_input.sneak
tag @a remove player_input.sprint

tag @a[tag=player_input.listen, predicate=player_input:forward] add player_input.forward
tag @a[tag=player_input.listen, predicate=player_input:backward] add player_input.backward
tag @a[tag=player_input.listen, predicate=player_input:left] add player_input.left
tag @a[tag=player_input.listen, predicate=player_input:right] add player_input.right
tag @a[tag=player_input.listen, predicate=player_input:jump] add player_input.jump
tag @a[tag=player_input.listen, predicate=player_input:sneak] add player_input.sneak
tag @a[tag=player_input.listen, predicate=player_input:sprint] add player_input.sprint

execute if score player.raw player_input.listeners matches 1.. as @a[tag=player_input.listen.raw] at @s run function #player_input:player/raw

# If only `raw` is being listened to, we can skip the rest of the function.
execute unless score player_tracking player_input.listeners matches 1.. run return 1

execute as @a[tag=player_input.tracking] run scoreboard players operation @s player_input.previous_tick = @s player_input.current_tick
scoreboard players set @a[tag=player_input.tracking] player_input.current_tick 0

scoreboard players add @a[tag=player_input.forward] player_input.current_tick 10
scoreboard players add @a[tag=player_input.backward] player_input.current_tick 100
scoreboard players add @a[tag=player_input.left] player_input.current_tick 1000
scoreboard players add @a[tag=player_input.right] player_input.current_tick 10000
scoreboard players add @a[tag=player_input.jump] player_input.current_tick 100000
scoreboard players add @a[tag=player_input.sneak] player_input.current_tick 1000000
scoreboard players add @a[tag=player_input.sprint] player_input.current_tick 10000000

scoreboard players set @a[tag=player_input.tracking] player_input.changed 0
execute as @a[tag=player_input.tracking] if score @s player_input.current_tick = @s player_input.previous_tick run \
    scoreboard players set @s player_input.changed 1

execute if score player.key_update player_input.listeners matches 1.. \
    as @a[tag=player_input.listen.key_update, scores={player_input.changed=1}] at @s run \
    function #player_input:player/key_update

execute if score player.key_down player_input.listeners matches 1.. \
    as @a[tag=player_input.listen.key_down, scores={player_input.changed=1}] at @s run \
    function player_input:zz_internal/player/key_down

execute if score player.key_up player_input.listeners matches 1.. \
    as @a[tag=player_input.listen.key_up, scores={player_input.changed=1}] at @s run \
    function player_input:zz_internal/player/key_up