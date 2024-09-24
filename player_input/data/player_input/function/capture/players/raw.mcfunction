#> raw.mcfunction
# Subscribes #player_input:player/raw to player input state **every tick** for all players.
# (To optimize, feel free to inline the commands below)a
scoreboard players add players player_input.listeners 1
scoreboard players add players.raw player_input.listeners 1
schedule function player_input:zz_internal/players_ticking 1t replace