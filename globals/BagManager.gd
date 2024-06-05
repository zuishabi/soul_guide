extends Node

var inventory:Array[Item]
var equipments_inventory:Array[Item]
var max_size=16
var equipments_kind:Dictionary={
	0:"HELMET",
	1:"CHESTARMOR",
	2:"LEGGUARD",
	3:"BOOTS",
	4:"MAINHAND",
	5:"OFFHAND"
}

signal on_bag_changed#当背包发生改变时发出，会使背包进行刷新

func _ready():
	equipments_inventory.resize(6)

func add_item(item_name:String,count:int):
	var item:Item=GlobalItemList.item_dictionary[item_name]
	if(item.can_fold):
		for i in inventory:
			if i.name==item.name:
				i.count+=count
				on_bag_changed.emit()
				return
		item.count=count
		if (inventory.size()-max_size<0):
			inventory.append(item)
	else:
		for i in count:
			var size=inventory.size()
			if (size-max_size<0):
				inventory.append(item)
	on_bag_changed.emit()

func delete_item(item_name:String,count:int)->bool:
	var item:Item=GlobalItemList.item_dictionary[item_name]
	if(item.can_fold):
		var i_item=find_item(item)
		if(i_item):
			if(i_item.count-count<0):
				return false
			else:
				i_item.count-=count
				if(i_item.count==0):
					inventory.erase(i_item)
		else:
			return false
	else:
		var target_time:int=0
		for i in inventory:
			if(i.name==item.name):
				target_time+=1
		if(target_time>=count):
			for i in count:
				inventory.erase(item)
		else:
			return false
	on_bag_changed.emit()
	return true

func find_item(item:Item)->Item:
	for i in inventory:
		if(i.name==item.name):
			return i
	return null
