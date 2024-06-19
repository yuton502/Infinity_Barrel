#> infinity_barrel:tick
# minecraft:tickから常時実行されます。
# @internal

#> 
# コマンド成功の否を保存します。通常使用する前にリセットします。
#declare score_holder $success_entity
scoreboard players set $success_entity IB_data 0

#ブロックがない場合村人を削除
execute as @e[type=minecraft:item_frame,tag=infinity_barrel] at @s positioned ^ ^ ^-0.5 if block ~ ~ ~ air run function infinity_barrel:destroy_infinity_barrel

execute as @a at @s as @e[type=minecraft:interaction,tag=infinity_barrel,distance=4..] run kill @s

#Infinity Barrelを見ていた場合はinteractionを召喚
execute as @a at @s if entity @e[type=minecraft:item_frame,tag=infinity_barrel,distance=..3.5] anchored eyes run function infinity_barrel:watch_effect

#Infinity Barrelを持っていたら移動速度低下を付与
execute as @a[predicate=infinity_barrel:have_infinity_barrel] at @s run summon area_effect_cloud ~ ~ ~ {Radius:0f,Duration:6,Age:4,Effects:[{Id:2b,Amplifier:1b,Duration:2,ShowParticles:0b}]}
