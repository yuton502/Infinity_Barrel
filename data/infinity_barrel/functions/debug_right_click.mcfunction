#> infinity_barrel:debug_right_click
# 村人を見ている状態で実行することで右クリックした時の処理を呼び出します。通常使うことはありません。
# @private

tag @s add IB_watcher
execute as @a[tag=IB_watcher] run data modify storage infinity_barrel: tag set value "IB_recieved_villager"
execute as @a[tag=IB_watcher] run scoreboard players set $success_entity IB_data 0
execute as @a[tag=IB_watcher] at @s anchored eyes run function infinity_barrel:add_tag
#execute as @a[tag=IB_watcher] at @s positioned ^ ^ ^5.1 as @e[type=minecraft:item_frame,distance=..5,tag=infinity_barrel] positioned as @s positioned ^ ^ ^100 facing entity @a[tag=IB_watcher,limit=1] eyes positioned ^ ^ ^100 positioned ~-0.5 ~-0.5 ~-0.5 if entity @s[dx=0,dy=0,dz=0] run tag @s add IB_recieved_villager

execute as @e[tag=IB_recieved_villager] at @s run function infinity_barrel:recieve
tag @a[tag=IB_watcher] remove IB_watcher
tag @e[tag=IB_recieved_villager] remove IB_recieved_villager

#scoreboard players set @a[scores={IB_right_click=1..}] IB_right_click 0
