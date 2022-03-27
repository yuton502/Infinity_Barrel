#> infinity_barrel:tune_items/clear_first
# player_item_tunerの動作を追加します。
# overflowが発生していない場合はアイテムを削除し、発生している場合はoverflow_countを個数として変更します。
# @within
#   player_item_tuner:**
#   infinity_barrel:**


#tellraw @p [{"text":"[before result] : "},{"nbt":"from.id","storage":"player_item_tuner:"}]

# アイテムコピー
data modify storage player_item_tuner:_ item set from storage player_item_tuner: from
# ifチェック(一致ならmatch=true)
execute store result storage player_item_tuner:_ match byte 1 run data modify storage player_item_tuner:_ item merge from storage infinity_barrel: player.removing_item
execute store result storage player_item_tuner:_ match byte 1 if data storage player_item_tuner:_ {match:false}

data modify storage player_item_tuner: to set from storage player_item_tuner: from
execute if data storage player_item_tuner:_ {match:true,overflow:false} run data modify storage player_item_tuner: to.id set value "minecraft:air"

execute if data storage player_item_tuner:_ {match:true,overflow:true} run data modify storage player_item_tuner: to.Count set from storage player_item_tuner:_ overflow_count

#tellraw @p [{"text":"[result] : "},{"nbt":"to.id","storage":"player_item_tuner:"}]




