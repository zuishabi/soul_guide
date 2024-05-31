extends Control

@onready var grid_slots = $PanelContainer/VBoxContainer/HBoxContainer/Slots/GridSlots

func _input(event):
	if event.is_action_pressed("bag")&&Global.is_in_dungeon&&!self.visible&&!get_tree().paused:
		Global.is_gaming=false
		get_tree().paused=true
		self.show()
		grid_slots.slots_update()
	elif event.is_action_pressed("bag")&&Global.is_in_dungeon&&self.visible&&get_tree().paused:
		Global.is_gaming=true
		get_tree().paused=false
		self.hide()
		grid_slots.slots_update()

func _on_texture_rect_gui_input(event:InputEvent):
	if event.is_action_pressed("mouse_left"):
		Global.is_gaming=true
		get_tree().paused=false
		self.hide()
		grid_slots.slots_update()
