#収納数を移す
execute as @e[tag=Carrying_Infinity_Barrel] store result score @s IB_data run data get entity @s Item.components.minecraft:custom_data.Stored
execute as @e[tag=Carrying_Infinity_Barrel] if data entity @s Item.components.minecraft:custom_data.RemoveTag run data remove entity @s Item.components.minecraft:custom_data
execute as @e[tag=Carrying_Infinity_Barrel] unless data entity @s Item.components.minecraft:custom_data.RemoveTag run data remove entity @s Item.components.minecraft:custom_data.Stored
#execute as @e[tag=Carrying_Infinity_Barrel] unless data entity @s Item.components.minecraft:custom_data.RemoveTag run data remove entity @s Item.components.minecraft:custom_data.UUID

#原木に置かれていない場合、アイテム化させる
execute as @e[tag=Carrying_Infinity_Barrel] at @s positioned ^ ^ ^-0.5 unless block ~ ~ ~ #minecraft:logs run function infinity_barrel:carry_barrel
execute as @e[tag=Carrying_Infinity_Barrel] at @s positioned ^ ^ ^-0.5 unless block ~ ~ ~ #minecraft:logs run data merge entity @s {Pos:[0.0d, -65.0d, 0.0d],Health:0f,DeathTime:18s,Age:500}

#設置処理
execute at @e[tag=Carrying_Infinity_Barrel] positioned ^ ^ ^-0.5 if block ~ ~ ~ #minecraft:logs run give @s minecraft:minecart 1
execute as @e[tag=Carrying_Infinity_Barrel] run data merge entity @s {Invulnerable:1b}
tag @e[tag=Carrying_Infinity_Barrel] add infinity_barrel
tag @e[tag=Carrying_Infinity_Barrel] remove Carrying_Infinity_Barrel

advancement revoke @s only infinity_barrel:set_carried_infinity_barrel