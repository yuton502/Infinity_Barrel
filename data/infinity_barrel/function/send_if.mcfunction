#> infinity_barrel:send_if
# 左クリック時のプレイヤーがいたとき、ファンクションを実行します。
# @internal

tag @s add IB_watcher
scoreboard players set @e[type=minecraft:interaction,tag=infinity_barrel,distance=..3.5] IB_data_success 1

data modify storage infinity_barrel: player_uuid set from entity @s UUID
execute as @e[type=minecraft:interaction,tag=infinity_barrel,distance=..3.5] store success score @s IB_data_success run data modify storage infinity_barrel: player_uuid set from entity @s attack.player

execute as @e[type=minecraft:interaction,tag=infinity_barrel,scores={IB_data_success=0},predicate=infinity_barrel:have_interaction_nbt,sort=nearest] at @s positioned ~ ~0.5 ~ as @e[type=minecraft:item_frame,tag=infinity_barrel,distance=..0.5,limit=1,sort=nearest] run function infinity_barrel:send

#プレイヤー情報を削除
execute as @e[type=minecraft:interaction,tag=infinity_barrel,scores={IB_data_success=0}] run data remove entity @s attack

tag @s remove IB_watcher
advancement revoke @s only infinity_barrel:attacked_interaction