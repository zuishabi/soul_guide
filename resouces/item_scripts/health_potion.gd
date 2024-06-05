class_name HealthPotion
extends Item

func effect():
	BagManager.delete_item("health_potion",1)
	PlayerEffectManager.add_hp(10)
