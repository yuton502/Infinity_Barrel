#> infinity_barrel:initial_search
# infinity_barrelが設置された際、実行します。まだinfinity_barrelのタグが突いていないアイテムフレームにタグを付与します。
# @internal

execute as @e[type=minecraft:item_frame,distance=..0.5,tag=!infinity_barrel,limit=1,sort=nearest] at @s if block ^ ^ ^-0.5 #minecraft:logs store success score $success_entity3 IB_data run tag @s add infinity_barrel_initial

#視線トレース　アイテムフレームorブロックがあった場合終了
execute if entity @s[distance=..6] positioned ^ ^ ^0.8 unless entity @e[type=minecraft:item_frame,tag=infinity_barrel_initial,distance=..0.1] if block ^ ^ ^-0.5 air if score $success_entity3 IB_data matches ..0 run function infinity_barrel:initial_search