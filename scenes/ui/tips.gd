extends PanelContainer

var current_slot:int=-1#当当前格子为-1时说明没有被选中
var current_kind:String
var current_item:Item

@onready var using = $VBoxContainer/using
@onready var bag = $".."

func update_tips(where:int,kind:String):
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
	current_item.effect()
	bag.hide_tips()

func _on_cancel_pressed():
	bag.hide_tips()
