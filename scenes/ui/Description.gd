extends PanelContainer

@onready var description_text =$MarginContainer/VBoxContainer/DescriptionText
@onready var name_text = $MarginContainer/VBoxContainer/Name
@onready var coin_label = $MarginContainer/VBoxContainer/HBoxContainer/CoinLabel
@onready var equipment_info = $MarginContainer/VBoxContainer/EquipmentInfo

func update_description_bag(where:int,kind:String):
	if(kind=="BAG"):
		update_description(Vector2(851,141),BagManager.inventory[where])
	else:
		update_description(Vector2(851,141),BagManager.equipments_inventory[where])

func update_description(position:Vector2,item:Item):
	self.position=position
	description_text.clear()
	description_text.append_text(item.description)
	name_text.text=item.name
	coin_label.text=str(item.value)
	if(item.item_type=="Equipment"):#如果物品类型是装备，则调用装备显示函数,否则隐藏
		equipment_info.show()
		equipment_info.update_info(item)
	else:
		equipment_info.hide()
