#> infinity_barrel:interacted_item_frame
# アイテムフレームにアイテムを入れた際、実行します。
# @internal

scoreboard players set $success_entity3 IB_data 0
execute as @s at @s anchored eyes run function infinity_barrel:initial_search
tag @e[tag=infinity_barrel_initial] add infinity_barrel

execute as @e[type=item_frame,tag=infinity_barrel_initial,tag=infinity_barrel,distance=..5] at @s run function infinity_barrel:set_infinity_barrel

tag @e[tag=infinity_barrel_initial] remove infinity_barrel_initial

advancement revoke @s only infinity_barrel:item_frame_interacted