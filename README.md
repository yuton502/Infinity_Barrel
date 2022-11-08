# Infinity_Barrel
 1種類のアイテムをより多く収納したい方に。最大で65536個(1024スタック)のアイテムを収納できます。

 ***

 I recommend this for you want to keep store many items of only 1 type.
 This can store 65,536 (1,024stacks) items.
 

# 前提条件 / Requirement
 * Minecraft Ver.1.17～
 * [PlayerItemTuner](https://github.com/Ai-Akaishi/PlayerItemTuner)

# 使い方 / How to use
 1. 原木を用意し、その側面にアイテムフレームを置きます。
 2. アイテムフレームに収納したいアイテムを置きます。
 3. 完了。左クリックで取り出し、右クリックで収納します。

 ***

 1. Place logs, and place item frame on this.
 2. Place item of you want to store on item frame.
 3. Done. Eject for left click, store for right click.

 # 設定 / Configration
 
 infinity_barrel:load.mcfunctionにあります。
 ```mcfunction
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
 ```
 - **$max_storage** <br>
 Infinity Barrelの最大容量を変更できます。初期値は65,536個(1,024スタック)です。
 - **$tp_type** <br>
 村人のテレポート方法を変更できます。0はテレポートが遅延しますが、村人は見えません。<br>
 1は瞬時にテレポートしすぐにinfinity barrelにアクセスできますが、村人は一瞬見えます。

 # アップデート予定 / Planned updates
 - ホッパーの使用可能
 - Infinity Barrelを運ぶアイテム

 # 更新履歴 / Changelogs
 ### Ver.1.1

 ### 変更点 / Changes
 - アイテムフレームを見たときのみプレイヤーの目の前に村人を召喚するようにした。<br>Changed summoning a villager in front players only if watching a item frame.
 - 何もアイテムを持っていなかった場合、右クリックした時にアイテムが増殖してしまうバグを修正。<br>Fixed the bug that an item duplicates when right clicking if player don't have any items.
 - 気に食わなかったfunction名を変更。<br>Changed some function name.
 - ブロックが破壊された際、infinity_barrelのInvulnerableが0bになるように<br>If block destroyed, infinity_barrel's `Invulnerable` changes 0b.

 ### Ver.1.0
 初公開。<br>
 First release.


