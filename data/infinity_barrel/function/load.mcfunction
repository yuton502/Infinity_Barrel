#> infinity_barrel:load
# minecraft:loadから実行されます。
# @internal

#declare objective IB_data
scoreboard objectives add IB_data dummy

#declare objective IB_data_success
scoreboard objectives add IB_data_success dummy

#declare score_holder $64
scoreboard players set $64 IB_data 64
scoreboard players set @a IB_data 0


#> 
#declare score_holder $max_storage
# infinity_barrelの最大容量
# Maximum storage of infinity_barrel
# 1 < $max_storage < 2147483646
scoreboard players set $max_storage IB_data 65536

# 村人のテレポート方法(v2.xで廃止)
# a way of teleporting a villager(removed above v2.x)

#scoreboard players set $tp_type IB_data 0

#村人の削除
execute as @e[type=minecraft:villager,tag=infinity_barrel] run data merge entity @s {Pos:[0.0d, -65.0d, 0.0d],Health:0f,DeathTime:18s}

tellraw @a ["",{"text":"[Infinity Barrel]","color":"aqua"},{"text":" Ver.3.0.1\n","color":"green"},{"text":"Produced by ","color":"gray"},{"text":"yuton502","color":"white"}]

