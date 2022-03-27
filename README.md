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
 
 infinity_barrel:load.mcfunction
 ```mcfunction
 # infinity_barrelの最大容量
 # Maximum storage of infinity_barrel
 # 1 < $max_storage < 2147483646
 scoreboard players set $max_storage IB_data 65536
 ```

 # 既知の問題 / Known issues
 - 付近をピストンで押さないでください。村人の位置がずれ、操作できなくなります。<br>Do not push by piston around. Villagers is be out of position, so can't operate.
