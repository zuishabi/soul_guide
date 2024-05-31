extends Node

var inventory:Array[Equipment]
var max_size=16

signal on_bag_changed

func add_item(item:Equipment,count:int):
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

func delete_item(item:Equipment,count:int):
	var flag:bool=true
	if(item.can_fold):
		for i in inventory:
			if i.name==item.name:
				i.count=clampi(i.count-count,0,1000)
				if i.count==0:
					inventory.erase(i)
				on_bag_changed.emit()
	else:
		for i in count:
			flag=false
			for j in inventory:
				if j.name==item.name:
					inventory.erase(j)
					flag=true
					break
			if(!flag):
				break
		on_bag_changed.emit()
	print(inventory)
