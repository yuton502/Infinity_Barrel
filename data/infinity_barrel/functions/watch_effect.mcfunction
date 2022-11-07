#> infinity_barrel:watch_effect
# infinity_barrelを見ている間は攻撃力増加のエフェクトを付与します。また、見られた直後村人を1体召喚します。
# @internal

execute if entity @e[type=minecraft:item_frame,distance=..0.5,tag=infinity_barrel,limit=1,sort=nearest] store success score $success_entity IB_data at @s run summon area_effect_cloud ~ ~ ~ {Radius:0f,Duration:6,Age:4,Effects:[{Id:5b,Amplifier:0b,Duration:2,ShowParticles:0b}]}
execute as @e[type=minecraft:item_frame,distance=..0.5,tag=infinity_barrel,limit=1,sort=nearest] if score $success_entity IB_data matches 1.. run function infinity_barrel:set_villager


#視線トレース　アイテムフレームorブロックがあった場合終了
execute if entity @s[distance=..6] positioned ^ ^ ^0.8 unless entity @e[type=minecraft:item_frame,tag=infinity_barrel,distance=..0.01] if block ^ ^ ^-0.5 air if score $success_entity IB_data matches ..0 run function infinity_barrel:watch_effect

execute if score $success_entity IB_data matches ..0 as @e[type=minecraft:villager,tag=infinity_barrel] run data merge entity @s {Pos:[0.0d, -65.0d, 0.0d],Health:0f,DeathTime:18s}
