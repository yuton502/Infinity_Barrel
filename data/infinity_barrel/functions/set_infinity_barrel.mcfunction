#> infinity_barrel:set_infinity_barrel
# infinity_barrelが設置された際に実行します。プレイヤーがアクセスできるように村人を設置します。
# @internal

#アイテムフレーム
data merge entity @s {Invulnerable:1b}
scoreboard players set @s IB_data 0

#村人
summon minecraft:villager ~ ~-1.5 ~ {Invulnerable:0b,LastGossipDecay:1000000000L,NoAI:1b,Silent:1b,NoGravity:1b,Offers:{},ActiveEffects:[{Id:11b,Amplifier:4,Duration:100000000,ShowParticles:false},{Id:14b,Amplifier:4,Duration:100000000,ShowParticles:false}],Tags:["infinity_barrel","infinity_barrel_initial"],VillagerData:{profession:"minecraft:nitwit"}}
execute as @e[type=villager,tag=infinity_barrel_initial] at @s rotated as @e[type=item_frame,tag=infinity_barrel_initial] run tp @s ^ ^ ^-0.2 ~ ~

tag @e[tag=infinity_barrel_initial] remove infinity_barrel_initial