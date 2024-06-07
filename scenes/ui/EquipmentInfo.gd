extends VBoxContainer

@onready var attribute_info = $AttributeInfo
@onready var basic_info = $BasicInfo

func update_info(item:Equipment):
	if(item.equipment_kind==BagManager.equipments_kind.MAINHAND||item.equipment_kind==BagManager.equipments_kind.OFFHAND):
		attribute_info.show()
		attribute_info.update_attribute_info(item)
	else:
		attribute_info.hide()
	basic_info.basic_update(item)
