class_name Item
extends Resource

@export var item_texture:Texture#物品的贴图
@export var can_fold:bool#是否可堆叠
@export var name:String#物品的名称
@export var description:String#物品的描述
@export var item_type:String#物品的类型
@export var value:int#物品的价值


var count:int=1

func effect():
	pass
