# If you want to track this for some reason make sure to store this in another scoreboard.
scoreboard players set keys_down player_input.current_tick 0
tag @s remove player_input.down.forward
tag @s remove player_input.down.backward
tag @s remove player_input.down.left
tag @s remove player_input.down.right
tag @s remove player_input.down.jump
tag @s remove player_input.down.sneak
tag @s remove player_input.down.sprint

tag @s[tag=player_input.forward, tag=!player_input.previous.forward] add player_input.down.forward
execute if entity @s[tag=player_input.down.forward] run scoreboard players add keys_down player_input.current_tick 10

tag @s[tag=player_input.backward, tag=!player_input.previous.backward] add player_input.down.backward
execute if entity @s[tag=player_input.down.backward] run scoreboard players add keys_down player_input.current_tick 100

tag @s[tag=player_input.left, tag=!player_input.previous.left] add player_input.down.left
execute if entity @s[tag=player_input.down.left] run scoreboard players add keys_down player_input.current_tick 1000

tag @s[tag=player_input.right, tag=!player_input.previous.right] add player_input.down.right
execute if entity @s[tag=player_input.down.right] run scoreboard players add keys_down player_input.current_tick 10000

tag @s[tag=player_input.jump, tag=!player_input.previous.jump] add player_input.down.jump
execute if entity @s[tag=player_input.down.jump] run scoreboard players add keys_down player_input.current_tick 100000

tag @s[tag=player_input.sneak, tag=!player_input.previous.sneak] add player_input.down.sneak
execute if entity @s[tag=player_input.down.sneak] run scoreboard players add keys_down player_input.current_tick 1000000

tag @s[tag=player_input.sneak, tag=!player_input.previous.sprint] add player_input.down.sprint
execute if entity @s[tag=player_input.down.sprint] run scoreboard players add keys_down player_input.current_tick 10000000


execute if score keys_down player_input.current_tick matches 10.. run function #player_input:player/key_down