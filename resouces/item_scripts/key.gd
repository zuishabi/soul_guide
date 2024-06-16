class_name key
extends Item

func effect():
	if(BagManager.delete_item(GlobalItemList.find_item("chest"),1)):
		BagManager.delete_item(GlobalItemList.find_item("key"),1)
		var loots:Array=LootsManager.get_loot("chest",1)
		for i in loots :
			BagManager.add_item(i,1)
	else:
		TipsEmitter.transmit_tips.emit("缺少箱子")
