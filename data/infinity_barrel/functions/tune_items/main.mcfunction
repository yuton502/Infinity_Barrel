#> infinity_barrel:tune_items/main
# player_item_tunerの動作を追加します。
# player_item_tuner:customの中身がIB_ClearFirstだった場合、infinity_barrel:tune_items/clear_firstを呼び出します。
# @within
#   player_item_tuner:**
#   infinity_barrel:**


execute if data storage player_item_tuner: {custom:"IB_ClearFirst"} run function infinity_barrel:tune_items/clear_first