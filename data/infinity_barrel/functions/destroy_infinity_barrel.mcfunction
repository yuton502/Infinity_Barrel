#> infinity_barrel:destroy_infinity_barrel
# infinity_barrelが破壊された際、中に収納されていたアイテムをばら撒きます。
# @internal

execute as @s run data modify storage infinity_barrel: storage_item set from entity @s Item

execute as @s if score @s IB_data < $64 IB_data store result storage infinity_barrel: storage_item.Count byte 1 run scoreboard players get @s IB_data
execute as @s if score @s IB_data < $64 IB_data run scoreboard players set @s IB_data 0
execute as @s if score @s IB_data >= $64 IB_data store result storage infinity_barrel: storage_item.Count byte 1 run scoreboard players get $64 IB_data
execute as @s if score @s IB_data >= $64 IB_data run scoreboard players remove @s IB_data 64

execute as @s at @s run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:cobblestone",Count:1b},Tags:["IB_changing_item"],Age:-6000s}
execute as @e[type=minecraft:item,tag=IB_changing_item] run data modify entity @s Item set from storage infinity_barrel: storage_item
tag @e[type=minecraft:item,tag=IB_changing_item] remove IB_changing_item

execute if score @s IB_data matches 1.. run function infinity_barrel:destroy_infinity_barrel
execute if score @s IB_data matches 0.. run tag @s remove infinity_barrel