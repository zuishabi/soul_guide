extends PanelContainer

@onready var description_text =$MarginContainer/VBoxContainer/DescriptionText
@onready var name_text = $MarginContainer/VBoxContainer/Name
@onready var coin_label = $MarginContainer/VBoxContainer/HBoxContainer/CoinLabel

func update_description(where:int,kind:String):
	if(kind=="BAG"):
		description_text.text=BagManager.inventory[where].description
		name_text.text=BagManager.inventory[where].name
		coin_label.text=str(BagManager.inventory[where].value)
	else:
		if(BagManager.equipments_inventory[where]):
			description_text.text=BagManager.equipments_inventory[where].description
			name_text.text=BagManager.equipments_inventory[where].name
			coin_label.text=str(BagManager.equipments_inventory[where].value)
		
