#> infinity_barrel:load
# minecraft:loadから実行されます。
# @internal

#declare objective IB_right_click
scoreboard objectives add IB_right_click minecraft.custom:minecraft.talked_to_villager

#declare objective IB_data
scoreboard objectives add IB_data dummy

#declare score_holder $64
scoreboard players set $64 IB_data 64
scoreboard players set @a IB_data 0


#> 
#declare score_holder $max_storage
# infinity_barrelの最大容量
# Maximum storage of infinity_barrel
# 1 < $max_storage < 2147483646
scoreboard players set $max_storage IB_data 65536

