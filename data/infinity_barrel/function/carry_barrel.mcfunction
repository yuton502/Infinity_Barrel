#> infinity_barrel:carry_barrel
# infinity_barrelを持ち運ぶ際、実行します。
# @s はitem_frameの必要があります。

#収納数を保存したアイテムフレームを召喚
summon item ~ ~ ~ {Tags:["IB_Changing_Item"],Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:enchantment_glint_override":1b,"minecraft:max_stack_size":1,"minecraft:custom_data":{Carrying_Infinity_Barrel:true},"minecraft:entity_data":{id:"minecraft:item_frame",Tags:["Carrying_Infinity_Barrel"],Item:{id:"minecraft:air",count:1}}}}}

scoreboard players set $success_entity IB_data 0

#Storedで収納数、UUIDで擬似的なスタック禁止
execute store success score $success_entity IB_data run data modify entity @e[type=item,tag=IB_Changing_Item,limit=1,sort=nearest] Item.components.minecraft:entity_data.Item.components set from entity @s Item.components
execute if score $success_entity IB_data matches 0 run data modify entity @e[type=item,tag=IB_Changing_Item,limit=1,sort=nearest] Item.components.minecraft:entity_data.Item.components.minecraft:custom_data.RemoveTag set value 1b

execute store result entity @e[type=item,tag=IB_Changing_Item,limit=1,sort=nearest] Item.components.minecraft:entity_data.Item.components.minecraft:custom_data.Stored int 1 run scoreboard players get @s IB_data
data modify entity @e[type=item,tag=IB_Changing_Item,limit=1,sort=nearest] Item.components.minecraft:entity_data.Item.id set from entity @s Item.id
data modify storage infinity_barrel: Item.id set from entity @s Item.id
item modify entity @e[type=item,tag=IB_Changing_Item,limit=1,sort=nearest] contents infinity_barrel:set_carry_barrel

execute as @e[type=minecraft:interaction,tag=infinity_barrel] run data merge entity @s {Pos:[0.0d, -65.0d, 0.0d],Health:0f,DeathTime:18s}

data merge entity @s {Pos:[0.0d, -65.0d, 0.0d],Health:0f,DeathTime:18s}
clear @a[tag=IB_watcher] minecraft:minecart 1
