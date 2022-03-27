#> infinity_barrel:initial_search
# infinity_barrelが設置された際、実行します。まだinfinity_barrelのタグが突いていないアイテムフレームにタグを付与します。
# @internal

#debug
#summon chicken ~ ~ ~ {NoAI:true,Silent:true,DeathLootTable:"minecraft:empty"}

#tag @e[type=minecraft:item_frame,distance=..0.5,tag=!infinity_barrel] add infinity_barrel_initial

execute as @e[type=minecraft:item_frame,distance=..0.5,tag=!infinity_barrel,limit=1,sort=nearest] at @s if block ^ ^ ^-0.5 #minecraft:logs store success score $success_entity3 IB_data run tag @s add infinity_barrel_initial

#tag @s add IB_watcher
#execute positioned ^ ^ ^10.1 as @e[type=minecraft:item_frame,distance=..10,tag=!infinity_barrel,limit=1] if data entity @s Item.id positioned as @s positioned ^ ^ ^1000 facing entity @a[tag=IB_watcher,limit=1] eyes positioned ^ ^ ^1000 positioned ~-0.5 ~-0.5 ~-0.5 if entity @s[dx=0,dy=0,dz=0] run tag @s add infinity_barrel_initial
#tag @s remove IB_watcher

#視線トレース　アイテムフレームorブロックがあった場合終了
execute if entity @s[distance=..6] positioned ^ ^ ^0.8 unless entity @e[type=minecraft:item_frame,tag=infinity_barrel_initial,distance=..0.1] if block ^ ^ ^-0.5 air if score $success_entity3 IB_data matches ..0 run function infinity_barrel:initial_search