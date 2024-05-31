class_name BagSlots
extends MarginContainer

@onready var timer = $Timer
@onready var highlight = $highlight
@onready var texture_rect = $MarginContainer/TextureRect
@onready var label = $MarginContainer/Label
@onready var margin_container = $MarginContainer
@onready var information =$tips/Information
@onready var usage = $tips/Usage

var can_show_information:bool=true

func slot_update(equipment:Equipment):
	margin_container.show()
	texture_rect.texture=equipment.equip_texture
	information.update_information(equipment.name,equipment.description)
	can_show_information=true
	usage.hide()
	if(equipment.count>1):
		label.show()
		label.text=str(equipment.count)
	else:
		label.hide()

func _on_mouse_entered():
	highlight.show()
	if margin_container.visible&&can_show_information:
		timer.start()

func _on_mouse_exited():
	highlight.hide()
	information.hide()
	timer.stop()

func _on_timer_timeout():
	information.position=get_local_mouse_position()
	information.show()

func _on_gui_input(event:InputEvent):
	if event.is_action_pressed("mouse_left")&&margin_container.visible:
		can_show_information=false
		information.hide()
		usage.show()

func _on_cancel_pressed():
	usage.hide()
	can_show_information=true
