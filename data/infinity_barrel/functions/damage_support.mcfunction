#> infinity_barrel:damage_support
# infinity_barrelを見ている間は攻撃力増加のエフェクトを付与します。
# @internal

##debug
#summon chicken ~ ~ ~ {NoAI:true,Silent:true,DeathLootTable:"minecraft:empty"}
#say hee

##execute as @e[type=minecraft:item_frame,distance=..0.5,tag=infinity_barrel,limit=1,sort=nearest] store success score $success_entity IB_data run summon area_effect_cloud ~ ~ ~ {Radius:0f,Duration:6,Age:4,Effects:[{Id:5b,Amplifier:0b,Duration:20,ShowParticles:0b}]}

#視線トレース　アイテムフレームorブロックがあった場合終了
#execute if entity @s[distance=..6] positioned ^ ^ ^0.8 unless entity @e[type=minecraft:item_frame,tag=infinity_barrel,distance=..0.1] if block ^ ^ ^-0.5 air if score $success_entity IB_data matches ..0 run function infinity_barrel:damage_support

execute if entity @e[type=minecraft:item_frame,distance=..0.5,tag=infinity_barrel,limit=1,sort=nearest] store success score $success_entity IB_data at @s run summon area_effect_cloud ~ ~ ~ {Radius:0f,Duration:6,Age:4,Effects:[{Id:5b,Amplifier:0b,Duration:2,ShowParticles:0b}]}


#視線トレース　アイテムフレームorブロックがあった場合終了
execute if entity @s[distance=..6] positioned ^ ^ ^0.8 unless entity @e[type=minecraft:item_frame,tag=infinity_barrel,distance=..0.1] if block ^ ^ ^-0.5 air if score $success_entity IB_data matches ..0 run function infinity_barrel:damage_support

