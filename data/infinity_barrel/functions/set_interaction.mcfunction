#> infinity_barrel:set_interaction
# infinity_barrel:watch_effectから実行されます。プレイヤーから見られた直後、interactionを1体召喚します。
# @internal

execute as @s at @s positioned ~ ~ ~ align y unless entity @e[type=minecraft:interaction,tag=infinity_barrel,distance=..0.5] run summon minecraft:interaction ^ ^ ^-0.2 {width:0.85,height:0.85,Tags:["infinity_barrel","infinity_barrel_initial"]}

tag @e[type=minecraft:interaction,tag=infinity_barrel_initial] remove infinity_barrel_initial

