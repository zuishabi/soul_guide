class_name chest
extends Item

func effect():
	if(BagManager.delete_item(GlobalItemList.find_item("key"),1)):
		BagManager.delete_item(GlobalItemList.find_item("chest"),1)
		var num=randi_range(1,5)
		var loots:Array[Item]=LootsManager.get_loot("chest",num)#生成随机的奖励
		Ui.chest_open_play(loots)
		await Ui.on_chest_open_finished
		for i in loots :
			BagManager.add_item(i,1)
	else:
		TipsEmitter.transmit_tips.emit("缺少钥匙，无法打开箱子")
