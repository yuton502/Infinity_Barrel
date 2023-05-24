#> infinity_barrel:send
# プレイヤーにアイテムを渡します。
# @internal


#コピー
execute as @s run data modify storage infinity_barrel: storage_item set from entity @s Item

#渡すためのアイテム数を指定
execute as @s if score @s IB_data < $64 IB_data store result storage infinity_barrel: storage_item.Count byte 1 run scoreboard players get @s IB_data
execute as @s if score @s IB_data >= $64 IB_data store result storage infinity_barrel: storage_item.Count byte 1 run scoreboard players get $64 IB_data

#アイテムを出現させる
execute as @s if score @s IB_data matches 1.. at @s run summon minecraft:item ^ ^ ^0.5 {Item:{id:"minecraft:cobblestone",Count:1b},Tags:["IB_changing_item"]}
execute as @e[type=minecraft:item,tag=IB_changing_item] run data modify entity @s Item set from storage infinity_barrel: storage_item
tag @e[type=minecraft:item,tag=IB_changing_item] remove IB_changing_item

#アイテム数に応じた減算
execute as @s if score @s IB_data < $64 IB_data run scoreboard players set @s IB_data 0
execute as @s if score @s IB_data >= $64 IB_data run scoreboard players remove @s IB_data 64

execute as @s run title @a[tag=IB_watcher] actionbar ["",{"text":"Item Stored : "},{"score":{"name":"@s","objective":"IB_data"}}]

playsound minecraft:entity.item_frame.remove_item block @a ~ ~ ~