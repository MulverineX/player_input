#> raw.mcfunction
# Subscribes #player_input:player/raw to player input state **every tick** for the current player.
# (To optimize, feel free to inline the commands below)
scoreboard players add @s player_input.listeners 1
scoreboard players add @s player_input.listen.raw 1
tag @s add player_input.listen
tag @s add player_input.listen.raw
scoreboard players set already_bulk player_input.current_tick 0
execute if score player player_input.listeners matches 10.. run scoreboard players set already_bulk player_input.current_tick 1
scoreboard players add player player_input.listeners 1
execute if score player player_input.listeners matches 10.. run scoreboard players set player_bulk player_input.listeners 1
execute if score player_bulk player_input.listeners matches 1 run function player_input:capture/player/bulk/raw

execute if score player_bulk player_input.listeners matches 1 run return 1

scoreboard players add player.raw player_input.listeners 1
schedule function player_input:zz_internal/player_ticking 1t replace