#> infinity_barrel:carry_barrel
# infinity_barrelを持ち運ぶ際、実行します。
# @s はitem_frameの必要があります。

#収納数を保存したアイテムフレームを召喚
summon item ~ ~ ~ {Tags:["IB_Changing_Item"],Item:{id:"minecraft:item_frame",Count:1b,tag:{Enchantments:[{}],EntityTag:{Tags:["Carrying_Infinity_Barrel"],Item:{id:"minecraft:air",Count:1b}},UUID:[I;0, 0, 0, 0]}}}

scoreboard players set $success_entity IB_data 0

#Storedで収納数、UUIDで擬似的なスタック禁止
execute store success score $success_entity IB_data run data modify entity @e[type=item,tag=IB_Changing_Item,limit=1,sort=nearest] Item.tag.EntityTag.Item.tag set from entity @s Item.tag
execute if score $success_entity IB_data matches 0 run data modify entity @e[type=item,tag=IB_Changing_Item,limit=1,sort=nearest] Item.tag.EntityTag.Item.tag.RemoveTag set value 1b

execute store result entity @e[type=item,tag=IB_Changing_Item,limit=1,sort=nearest] Item.tag.EntityTag.Item.tag.Stored int 1 run scoreboard players get @s IB_data
data modify entity @e[type=item,tag=IB_Changing_Item,limit=1,sort=nearest] Item.tag.EntityTag.Item.id set from entity @s Item.id
data modify storage infinity_barrel: Item.id set from entity @s Item.id
data modify entity @e[type=item,tag=IB_Changing_Item,limit=1,sort=nearest] Item.tag.UUID set from entity @s UUID
data modify entity @e[type=item,tag=IB_Changing_Item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Infinity Barrel","italic":"false"}'
data modify entity @e[type=item,tag=IB_Changing_Item,limit=1,sort=nearest] Item.tag.display.Lore append value '{"nbt":"Item.id","storage":"infinity_barrel:","color":"white","italic":"false"}'

execute as @e[type=minecraft:villager,tag=infinity_barrel] run data merge entity @s {Pos:[0.0d, -65.0d, 0.0d],Health:0f,DeathTime:18s}

data merge entity @s {Pos:[0.0d, -65.0d, 0.0d],Health:0f,DeathTime:18s}
clear @a[tag=IB_watcher] minecraft:minecart 1
