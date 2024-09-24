#> key_update.mcfunction
# Subscribes #player_input:player/key_update to player input state **changes** for all players.
# (To optimize, feel free to inline the commands below)
scoreboard players add players player_input.listeners 1
scoreboard players add players.key_update player_input.listeners 1
scoreboard players add player_tracking player_input.listeners 1
schedule function player_input:zz_internal/players_ticking 1t replace