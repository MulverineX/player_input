#> key_down.mcfunction
# Subscribes #player_input:player/key_down to a player starting to press a key (fires again after the key has been released then pressed again) for all players.
# (To optimize, feel free to inline the commands below)
scoreboard players add players player_input.listeners 1
scoreboard players add players.key_down player_input.listeners 1
scoreboard players add player_tracking player_input.listeners 1
schedule function player_input:zz_internal/players_ticking 1t replace