extends PanelContainer

@onready var item_name = $MarginContainer/VBoxContainer/Name
@onready var description = $MarginContainer/VBoxContainer/Description

func update_information(name:String,_description:String):
	item_name.text=name
	description.text=_description
