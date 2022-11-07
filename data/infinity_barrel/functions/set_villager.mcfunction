#> infinity_barrel:set_villager
# infinity_barrel:watch_effectから実行されます。プレイヤーから見られた直後、村人を1体召喚します。
# @internal

execute as @s at @s positioned ~ ~-1 ~ unless entity @e[type=minecraft:villager,tag=infinity_barrel,distance=..0.5] run summon minecraft:villager ~ -64 ~ {Invulnerable:0b,LastGossipDecay:1000000000L,NoAI:1b,Silent:1b,NoGravity:1b,Offers:{},ActiveEffects:[{Id:11b,Amplifier:4,Duration:100000000,ShowParticles:false},{Id:14b,Amplifier:4,Duration:100000000,ShowParticles:false}],Tags:["infinity_barrel","infinity_barrel_initial"],VillagerData:{profession:"minecraft:nitwit"}}


execute if score $tp_type IB_data matches 1 as @s at @s in minecraft:the_end run tp @e[type=minecraft:villager,tag=infinity_barrel_initial] 327680 ~5 327680
execute as @s at @s in overworld run tp @e[type=minecraft:villager,tag=infinity_barrel_initial] ^ ^-1 ^-0.2 ~ ~

tag @e[type=villager,tag=infinity_barrel_initial] remove infinity_barrel_initial

