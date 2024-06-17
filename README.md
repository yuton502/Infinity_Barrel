# Infinity_Barrel
 1種類のアイテムをより多く収納したい方に。最大で65536個(1024スタック)のアイテムを収納できます。

 ***

 I recommend this for you want to keep store many items of only 1 type.
 This can store 65,536 (1,024stacks) items.
 

# 前提条件 / Requirement
 * v1.x
   * Minecraft Ver.1.17～1.19.3
   * [PlayerItemTuner](https://github.com/Ai-Akaishi/PlayerItemTuner)
 * v2.x
   * Minecraft Ver.1.19.4～1.20.3
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

 # 村人のテレポート方法 (v2.xで廃止)
 # 0で遅延テレポート、1で瞬間テレポート(村人は見える)
 # a way of teleporting a villager
 # 0 is lazy teleporting, or 1 is instant teleporting(visible a villager)
 # 0 / 1
 scoreboard players set $tp_type IB_data 0
 ```
 - **$max_storage** <br>
 Infinity Barrelの最大容量を変更できます。初期値は65,536個(1,024スタック)です。
 - **$tp_type** (v2.xのみ廃止)<br>
 村人のテレポート方法を変更できます。0はテレポートが遅延しますが、村人は見えません。<br>
 1は瞬時にテレポートしすぐにinfinity barrelにアクセスできますが、村人は一瞬見えます。

 # アップデート予定 / Planned updates
 - ホッパーの使用可能

 # 更新履歴 / Changelogs
  ### Ver.2.0.0

 ### 追加点 / Additions

- 対応バージョンを1.19.4以降に変更<br>Support version changes to 1.19.4 and above
- 村人からinteractionに変更し、それに伴い色々の構文の変更<br>Detection entity has changed to interactions from villagers, changed a lot of syntaxes with that.

 ### 変更点 / Changes

- 何もアイテムを持っていないときに右クリックした場合、以前持っていた最初のアイテムがコピーされてしまう不具合を修正<br>Fixed the bug that duplicated item that player had before, if right click when player has not any items.
***
 ### Ver.1.1.0

 ### 追加点 / Additions

- Infinity Barrelを持ち運べる機能の追加<br>Added ability to carry infinity barrel.
- トロッコを持ってShift右クリックで、そのInfinity Barrelをアイテム化させることができる<br>Shift-right click with the minecart to itemize its Infinity Barrel.
- アイテム状態のInfinity Barrelを持つと移動速度低下が付与される<br>Holding an itemized infinity barrel will give slowness.
- 原木の側面であれば再設置可能<br>Can be re-set up on only the side face of logs.

 ### 変更点 / Changes

- 村人が拾えるアイテムを収納している際、取り出したアイテムが村人に奪われ消えてしまうバグを修正<br>Fixed the bug that taken out items are taken away by villagers and disappear when storing items that villagers can pick up.
- Infinity Barrelを設置できない場所に再設置した場合、トロッコが複製されてしまうバグを修正<br>Fixed the bug that replicates a minecart when re-set up on the side face of the can't re-set up blocks.
***
 ### Ver.1.0.2
 
 ### 変更点 / Changes
- watch_effect.mcfunctionの影響範囲を縮小。<br>It made narrow of affect radius of watch_effect.mcfunction.
- アイテムの種類が保存されていて、かつ保管数が0の場合に引き出そうとすると、丸石が出てきてしまうバグを修正。<br>Fixed the bug that spawning a cobblestone in case of saved only the item type and stored none.
- Geyser環境で複製できるバグを緩和<br>Mitigate the bug that replicating item in GeyserMC.
***
 ### Ver.1.0.1

 ### 変更点 / Changes
 - アイテムフレームを見たときのみプレイヤーの目の前に村人を召喚するようにした。<br>Changed summoning a villager in front players only if watching a item frame.
 - 何もアイテムを持っていなかった場合、右クリックした時にアイテムが増殖してしまうバグを修正。<br>Fixed the bug that an item duplicates when right clicking if player don't have any items.
 - 気に食わなかったfunction名を変更。<br>Changed some function name.
 - ブロックが破壊された際、infinity_barrelのInvulnerableが0bになるように<br>If block destroyed, infinity_barrel's `Invulnerable` changes 0b.
***
 ### Ver.1.0
 初公開。<br>
 First release.
