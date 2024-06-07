extends PanelContainer

var current_slot:int=-1#当当前格子为-1时说明没有被选中
var current_kind:String#当前选中的类型
var current_item:Item#当前储存的物品
var current_where:int#当前存储物品所在的位置

@onready var using = $VBoxContainer/using
@onready var bag = $".."

func update_tips(where:int,kind:String):
	current_where=where
	if(current_slot!=-1&&current_kind!=kind):
		get_parent().hide_tips()
	elif(current_slot!=-1&&current_slot!=where):
		get_parent().hide_tips()
	current_kind=kind
	current_slot=where
	current_item=get_item(where,kind)

func get_item(where:int,kind:String)->Item:
	if(kind=="BAG"):
		if(BagManager.inventory[where].item_type=="Item"):
			using.text="USING"
		else:
			using.text="EQUIP"
		return BagManager.inventory[where]
	else:
		using.text="UNFIX"
		return BagManager.equipments_inventory[where]

func _on_using_pressed():
	if(using.text=="USING"):
		current_item.effect()
	elif(using.text=="EQUIP"):
		BagManager.equip(current_where)
	else:
		BagManager.unfix(current_where)
	bag.hide_tips()

func _on_cancel_pressed():
	bag.hide_tips()
