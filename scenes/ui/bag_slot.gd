class_name BagSlots
extends MarginContainer

signal show_information(where:int)
signal hide_information
signal show_tips(where:int)


@onready var highlight = $highlight
@onready var texture_rect = $MarginContainer/TextureRect
@onready var label = $MarginContainer/Label
@onready var margin_container = $MarginContainer
@onready var selected = $Selected

var where:int#此格子所在的库存位置
var kind:String

func _ready():
	kind="BAG"

func slot_update(where:int):
	self.where=where
	margin_container.show()
	texture_rect.texture=BagManager.inventory[where].item_texture
	if(BagManager.inventory[where].count>1):
		label.show()
		label.text=str(BagManager.inventory[where].count)
	else:
		label.hide()

func _on_mouse_entered():
	highlight.show()
	if(margin_container.visible):
		show_information.emit(where,kind)

func _on_mouse_exited():
	highlight.hide()
	if(margin_container.visible):
		hide_information.emit()

func _on_gui_input(event:InputEvent):
	if event.is_action_pressed("mouse_left")&&margin_container.visible:
		selected.show()
		show_tips.emit(where,kind)

func hide_tips():
	selected.hide()
