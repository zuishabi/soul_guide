class_name chest
extends Item

func effect():
	if(BagManager.delete_item(GlobalItemList.find_item("key"),1)):
		BagManager.delete_item(GlobalItemList.find_item("chest"),1)
		BagManager.add_item(GlobalItemList.find_item("sword"),1)
	else:
		TipsEmitter.transmit_tips.emit("缺少钥匙，无法打开箱子")
