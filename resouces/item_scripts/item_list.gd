extends Node

var key:Item=preload("res://resouces/item_resources/key.tres")
var chest:Item=preload("res://resouces/item_resources/chest.tres")
var health_potion:Item=preload("res://resouces/item_resources/health_potion.tres")
var sword:Item=preload("res://resouces/item_resources/sword.tres")
var helmet:Item=preload("res://resouces/item_resources/helmet.tres")
var chest_armor=preload("res://resouces/item_resources/chestarmor.tres")

var item_dictionary:Dictionary={
	"key":key,
	"chest":chest,
	"health_potion":health_potion,
	"sword":sword,
	"helmet":helmet,
	"chestarmor":chest_armor
}

func find_item(item_name:String)->Item:
	return item_dictionary[item_name]
