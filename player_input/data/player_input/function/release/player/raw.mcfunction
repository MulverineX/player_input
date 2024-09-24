#> raw.mcfunction
# Notifies the library that there is one less dependent listening for the data.
# (Warning: the function tag will continue to be called until the last dependent is removed.)
# (To optimize, feel free to inline the commands below)
execute unless score @s player_input.listeners matches 0 run scoreboard players remove @s player_input.listeners 1
execute unless score @s player_input.listen.raw matches 0 run scoreboard players remove @s player_input.listen.raw 1
execute unless score @s player_input.listeners matches 1.. run tag @s remove player_input.listen
execute unless score @s player_input.listen.raw matches 1.. run tag @s remove player_input.listen.raw
execute unless score player player_input.listeners matches 0 run scoreboard players remove player player_input.listeners 1
execute unless score player.raw player_input.listeners matches 0 run scoreboard players remove player.raw player_input.listeners 1
execute if score players player_input.listeners matches 0 run return 1
execute if score player player_input.listeners matches ..9 run scoreboard players set player_bulk player_input.listeners 0
execute if score player player_input.listeners matches ..9 run scoreboard players set player_bulk player_input.listeners 0
execute \
    unless score players player_input.listeners matches 0 \
    if score player_bulk player_input.listeners matches 0 run \
        scoreboard players remove players player_input.listeners 1