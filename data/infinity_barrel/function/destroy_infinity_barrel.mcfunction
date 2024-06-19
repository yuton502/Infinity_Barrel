#> infinity_barrel:destroy_infinity_barrel
# infinity_barrelが破壊された際、中に収納されていたアイテムをばら撒きます。
# @internal

execute as @s run data modify storage infinity_barrel: storage_item set from entity @s Item

execute as @s if score @s IB_data < $64 IB_data store result storage infinity_barrel: storage_item.count int 1 run scoreboard players get @s IB_data
execute as @s if score @s IB_data < $64 IB_data run scoreboard players set @s IB_data 0
execute as @s if score @s IB_data >= $64 IB_data store result storage infinity_barrel: storage_item.count int 1 run scoreboard players get $64 IB_data
execute as @s if score @s IB_data >= $64 IB_data run scoreboard players remove @s IB_data 64

execute as @s at @s unless data storage infinity_barrel: {storage_item:{count:0}} run function infinity_barrel:send_item with storage infinity_barrel: {}



execute if score @s IB_data matches 1.. run function infinity_barrel:destroy_infinity_barrel
execute if score @s IB_data matches 0.. run data merge entity @s {Invulnerable:0b}
execute if score @s IB_data matches 0.. run tag @s remove infinity_barrel