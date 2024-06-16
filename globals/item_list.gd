extends Node

@export var item_dictionary:Dictionary={}

func find_item(item_name:String)->Item:
	return item_dictionary[item_name]
