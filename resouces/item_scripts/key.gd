class_name key
extends Item

func effect():
	if(BagManager.delete_item("chest",1)):
		BagManager.delete_item("key",1)
		BagManager.add_item("health_potion",1)
	else:
		TipsEmitter.transmit_tips.emit("缺少箱子")
