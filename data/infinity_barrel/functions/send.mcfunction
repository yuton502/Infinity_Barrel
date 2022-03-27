#> infinity_barrel:send
# プレイヤーにアイテムを渡します。
# @internal

#殴った村人からアイテムフレームを指定
tag @s add IB_watcher
data modify storage infinity_barrel: tag set value "IB_sent_villager"
scoreboard players set $success_entity IB_data 0
execute as @a[tag=IB_watcher] at @s anchored eyes run function infinity_barrel:recursive_search
#execute positioned ^ ^ ^5.1 as @e[type=minecraft:item_frame,distance=..5,tag=infinity_barrel] positioned as @s positioned ^ ^ ^100 facing entity @a[tag=IB_watcher,limit=1] eyes positioned ^ ^ ^100 positioned ~-0.5 ~-0.5 ~-0.5 if entity @s[dx=0,dy=0,dz=0] as @e[type=minecraft:item_frame,dx=0,dy=0,dz=0,limit=1,sort=nearest,tag=infinity_barrel] run tag @s add IB_sent_villager
#tag @e[type=minecraft:villager,tag=infinity_barrel,distance=..5,nbt={HurtTime:10s}] add IB_sent_villager
#execute as @e[type=minecraft:villager,tag=IB_sent_villager] at @s run tag @e[type=minecraft:item_frame,distance=..0.1,tag=infinity_barrel] add IB_sent_villager

#コピー
execute as @e[tag=IB_sent_villager] run data modify storage infinity_barrel: storage_item set from entity @s Item

#渡すためのアイテム数を指定
execute as @e[tag=IB_sent_villager] if score @s IB_data < $64 IB_data store result storage infinity_barrel: storage_item.Count byte 1 run scoreboard players get @s IB_data
execute as @e[tag=IB_sent_villager] if score @s IB_data < $64 IB_data run scoreboard players set @s IB_data 0
execute as @e[tag=IB_sent_villager] if score @s IB_data >= $64 IB_data store result storage infinity_barrel: storage_item.Count byte 1 run scoreboard players get $64 IB_data
execute as @e[tag=IB_sent_villager] if score @s IB_data >= $64 IB_data run scoreboard players remove @s IB_data 64

#アイテムを出現させる
execute as @e[tag=IB_sent_villager] at @s run summon minecraft:item ^ ^ ^0.5 {Item:{id:"minecraft:cobblestone",Count:1b},Tags:["IB_changing_item"]}
execute as @e[type=minecraft:item,tag=IB_changing_item] run data modify entity @s Item set from storage infinity_barrel: storage_item
tag @e[type=minecraft:item,tag=IB_changing_item] remove IB_changing_item

execute as @e[tag=IB_sent_villager] run title @a[tag=IB_watcher] actionbar ["",{"text":"Item Stored : "},{"score":{"name":"@s","objective":"IB_data"}}]

tag @a[tag=IB_watcher] remove IB_watcher
tag @e[tag=IB_sent_villager] remove IB_sent_villager
advancement revoke @s only infinity_barrel:attacked_villager