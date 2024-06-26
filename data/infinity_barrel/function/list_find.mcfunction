#> infinity_barrel:list_find
# Listタグの中に目的のアイテムが有るかどうかを検索します。ある場合はアイテムNBTと個数を取得します
# @internal

#コピー失敗したら個数加算

#事前にコピー&余計な要素を削除
data modify storage infinity_barrel: player.temp_item set from storage infinity_barrel: player.items[-1]
data modify storage infinity_barrel: player.items[-1].count set from storage infinity_barrel: storage_item.count
data remove storage infinity_barrel: player.items[-1].Slot

#プレイヤーのアイテムとアイテムフレームのアイテムを比較
#成功($success_data=0)したらアイテムNBTと個数を取得
#最初から何も持っていない場合は強制的に失敗させる
execute store success score $success_data IB_data run data modify storage infinity_barrel: player.items[-1] set from storage infinity_barrel: storage_item
execute unless data storage infinity_barrel: player.items[-1] run scoreboard players set $success_data IB_data 1

execute if score $success_data IB_data matches ..0 store result score $count IB_data run data get storage infinity_barrel: player.temp_item.count
execute if score $success_data IB_data matches ..0 run data modify storage infinity_barrel: player.removing_item set from storage infinity_barrel: player.temp_item
execute if score $success_data IB_data matches ..0 run data modify storage infinity_barrel: player.removing_item.id set from storage infinity_barrel: player.temp_item.id

data remove storage infinity_barrel: player.items[-1]
data remove storage infinity_barrel: player.temp_item

execute if data storage infinity_barrel: player.items[-1] run function infinity_barrel:list_find