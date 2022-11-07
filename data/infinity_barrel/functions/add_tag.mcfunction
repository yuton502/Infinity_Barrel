#> infinity_barrel:add_tag
# infinity_barrelにクリックした際、実行します。プレイヤーの目線の先にあるinfinity_barrelにtagを付与します。
# @internal

execute as @e[type=minecraft:item_frame,distance=..0.5,tag=infinity_barrel,limit=1,sort=nearest] store success score $success_entity IB_data run data modify entity @s Tags append from storage infinity_barrel: tag

#視線トレース　アイテムフレームorブロックがあった場合終了
execute if entity @s[distance=..6] positioned ^ ^ ^0.8 unless entity @e[type=minecraft:item_frame,tag=infinity_barrel,distance=..0.1] if block ^ ^ ^-0.5 air if score $success_entity IB_data matches ..0 run function infinity_barrel:add_tag