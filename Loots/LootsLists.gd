extends Node

@export var loot_list:Dictionary

func sort_ascending(a:Loot, b:Loot):
	if a.weight < b.weight:
		return true
	return false

func find_loot(loot_name:String)->Array[Loot]:
	return loot_list[loot_name].loots

func get_loot(loot_name:String,loot_num:int)->Array[Item]:
	var final_loots:Array[Item]
	var current_value:int
	var sum_weight:int=0
	var loot_array:Array[Loot]=find_loot(loot_name)
	loot_array.sort_custom(sort_ascending)
	var temp_array:Array[int]
	temp_array.resize(loot_array.size())
	for i in loot_array.size():
		sum_weight+=loot_array[i].weight
		if i>=1:
			temp_array[i]=loot_array[i].weight+temp_array[i-1]
		else:
			temp_array[i]=loot_array[i].weight
	for i in loot_num:
		current_value=randi_range(1,sum_weight)
		for j in loot_array.size():
			var weight:int=temp_array[j]
			if(current_value<=weight):
				final_loots.append(GlobalItemList.find_item(loot_array[j].name))
				break
	return final_loots
