#> infinity_barrel:tick
# minecraft:tickから常時実行されます。
# @internal

#> 
# コマンド成功の否を保存します。通常使用する前にリセットします。
#declare score_holder $success_entity
scoreboard players set $success_entity IB_data 0

#ブロックがない場合村人を削除
execute as @e[type=minecraft:item_frame,tag=infinity_barrel] at @s positioned ^ ^ ^-0.5 if block ~ ~ ~ air run function infinity_barrel:destroy_infinity_barrel

execute as @e[type=minecraft:villager,tag=infinity_barrel] run data merge entity @s {HurtTime:0s}

#Infinity Barrelを見ていた場合は攻撃力増加を付与
execute as @a at @s if entity @e[type=minecraft:item_frame,tag=infinity_barrel,distance=..5] anchored eyes run function infinity_barrel:watch_effect


#右クリック検知
tag @a[scores={IB_right_click=1..}] add IB_watcher
execute as @a[tag=IB_watcher] run data modify storage infinity_barrel: tag set value "IB_recieved_villager"
execute as @a[tag=IB_watcher] run scoreboard players set $success_entity IB_data 0
execute as @a[tag=IB_watcher] at @s anchored eyes run function infinity_barrel:add_tag

execute as @e[tag=IB_recieved_villager] at @s run function infinity_barrel:recieve
tag @a[tag=IB_watcher] remove IB_watcher
tag @e[tag=IB_recieved_villager] remove IB_recieved_villager

scoreboard players set @a[scores={IB_right_click=1..}] IB_right_click 0
