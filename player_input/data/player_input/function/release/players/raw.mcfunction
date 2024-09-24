#> raw.mcfunction
# Notifies the library that there is one less dependent listening for the data.
# (Warning: the function tag will continue to be called until the last dependent is removed.)
# (To optimize, feel free to inline the commands below)
execute unless score players player_input.listeners matches 0 run scoreboard players remove players player_input.listeners 1
execute unless score players player_input.listeners matches 0 run scoreboard players remove players.raw player_input.listeners 1