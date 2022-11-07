#> infinity_barrel:set_infinity_barrel
# infinity_barrelが設置された際に実行します。
# @internal

#アイテムフレーム
data merge entity @s {Invulnerable:1b}
scoreboard players set @s IB_data 0


tag @e[tag=infinity_barrel_initial] remove infinity_barrel_initial