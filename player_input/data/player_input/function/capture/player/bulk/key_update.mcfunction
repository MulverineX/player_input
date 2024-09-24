execute unless score already_bulk player_input.current_tick matches 1 run scoreboard players add players player_input.listeners 1
scoreboard players add players.key_update player_input.listeners 1
schedule function player_input:zz_internal/players_ticking 1t replace