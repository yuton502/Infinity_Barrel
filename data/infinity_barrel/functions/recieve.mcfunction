#> infinity_barrel:recieve
# プレイヤーからアイテムを受け取ります。
# @internal

#リセット
data modify storage player_item_tuner:_ overflow set value false
#data modify storage player_item_tuner:_ overflow_count set value 0
data modify storage infinity_barrel: player.items set from entity @p[tag=IB_watcher] Inventory
data modify storage infinity_barrel: storage_item set from entity @s Item
scoreboard players set $count IB_data 0

#アイテムリスト検索
function infinity_barrel:list_find
#say hee

# 検索したアイテムの個数をinfinity_barrelに保存
scoreboard players operation $temp_count IB_data = @s IB_data
execute if score $count IB_data >= $64 IB_data run scoreboard players add @s IB_data 64
execute if score $count IB_data < $64 IB_data run scoreboard players operation @s IB_data += $count IB_data
#tellraw @a ["",{"text":"Item Stored : "},{"score":{"name":"$count","objective":"IB_data"}}]

#最大収納上限に達する場合、減らす数を計算する
execute if score @s IB_data > $max_storage IB_data store success storage player_item_tuner:_ overflow byte 1 run scoreboard players operation $count IB_data += $temp_count IB_data
#execute if score @s IB_data > $max_storage IB_data run scoreboard players operation $count IB_data -= $max_storage IB_data
execute if score @s IB_data > $max_storage IB_data store result storage player_item_tuner:_ overflow_count int 1 run scoreboard players operation $count IB_data -= $max_storage IB_data


#インベントリ変更
execute if score $temp_count IB_data < $max_storage IB_data run data modify storage player_item_tuner: custom set value "IB_ClearFirst"
execute if score $temp_count IB_data < $max_storage IB_data as @a[tag=IB_watcher] run function #player_item_tuner:custom/inventory

#収納数が最大数を超えている場合、最大数に直す
execute if score @s IB_data > $max_storage IB_data run scoreboard players operation @s IB_data = $max_storage IB_data
title @a[tag=IB_watcher] actionbar ["",{"text":"Item Stored : "},{"score":{"name":"@s","objective":"IB_data"}}]



