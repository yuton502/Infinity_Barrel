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

# 村人のテレポート方法
# 0で遅延テレポート、1で瞬間テレポート(村人は見える)
# a way of teleporting a villager
# 0 is lazy tereporting, or 1 is instant tereporting(visible a villager)
# 0 / 1
scoreboard players set $tp_type IB_data 0


execute in minecraft:the_end run forceload add 327680 327680

tellraw @a ["",{"text":"[Infinity Barrel]","color":"aqua"},{"text":" Ver.1.0.1\n","color":"green"},{"text":"Produced by ","color":"gray"},{"text":"yuton502","color":"white"}]

