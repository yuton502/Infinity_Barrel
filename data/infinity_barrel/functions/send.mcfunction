#> infinity_barrel:send
# プレイヤーにアイテムを渡します。
# @internal

#殴った村人からアイテムフレームを指定
tag @s add IB_watcher
data modify storage infinity_barrel: tag set value "IB_sent_villager"
scoreboard players set $success_entity IB_data 0
execute as @a[tag=IB_watcher] at @s anchored eyes run function infinity_barrel:add_tag

#コピー
execute as @e[tag=IB_sent_villager] run data modify storage infinity_barrel: storage_item set from entity @s Item

#渡すためのアイテム数を指定
execute as @e[tag=IB_sent_villager] if score @s IB_data < $64 IB_data store result storage infinity_barrel: storage_item.Count byte 1 run scoreboard players get @s IB_data
execute as @e[tag=IB_sent_villager] if score @s IB_data >= $64 IB_data store result storage infinity_barrel: storage_item.Count byte 1 run scoreboard players get $64 IB_data

#アイテムを出現させる
execute as @e[tag=IB_sent_villager] if score @s IB_data matches 1.. at @s run summon minecraft:item ^ ^ ^0.5 {Item:{id:"minecraft:cobblestone",Count:1b},Tags:["IB_changing_item"]}
execute as @e[type=minecraft:item,tag=IB_changing_item] run data modify entity @s Item set from storage infinity_barrel: storage_item
tag @e[type=minecraft:item,tag=IB_changing_item] remove IB_changing_item

#アイテム数に応じた減算
execute as @e[tag=IB_sent_villager] if score @s IB_data < $64 IB_data run scoreboard players set @s IB_data 0
execute as @e[tag=IB_sent_villager] if score @s IB_data >= $64 IB_data run scoreboard players remove @s IB_data 64

execute as @e[tag=IB_sent_villager] run title @a[tag=IB_watcher] actionbar ["",{"text":"Item Stored : "},{"score":{"name":"@s","objective":"IB_data"}}]

tag @a[tag=IB_watcher] remove IB_watcher
tag @e[tag=IB_sent_villager] remove IB_sent_villager
advancement revoke @s only infinity_barrel:attacked_villager