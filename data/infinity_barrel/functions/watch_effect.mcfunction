#> infinity_barrel:watch_effect
# infinity_barrelを見ている間は攻撃力増加のエフェクトを付与します。また、見られた直後村人を1体召喚します。
# @internal

#
execute if score $success_entity IB_data matches ..0 as @e[type=minecraft:interaction,tag=infinity_barrel] run kill @s

execute as @e[type=minecraft:item_frame,distance=..0.5,tag=infinity_barrel,limit=1,sort=nearest] at @s run function infinity_barrel:set_interaction


#視線トレース　アイテムフレームorブロックがあった場合終了
execute if entity @s[distance=..3.5] positioned ^ ^ ^0.8 unless entity @e[type=minecraft:item_frame,tag=infinity_barrel,distance=..0.01] if block ^ ^ ^-0.5 air if score $success_entity IB_data matches ..0 run function infinity_barrel:watch_effect

