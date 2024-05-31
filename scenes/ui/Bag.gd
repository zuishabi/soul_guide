extends Control

@onready var grid_slots = $PanelContainer/VBoxContainer/HBoxContainer/Slots/GridSlots
@onready var description = $Description
@onready var description_cd = $Description_CD
@onready var tips = $tips

var selected:bool=false#是否有格子被选中

var description_visible

func _ready():
	for i:BagSlots in grid_slots.get_children():
		i.show_information.connect(show_description)
		i.hide_information.connect(hide_description)
		i.show_tips.connect(show_tips)

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

#退出按钮
func _on_texture_rect_gui_input(event:InputEvent):
	if event.is_action_pressed("mouse_left"):
		Global.is_gaming=true
		get_tree().paused=false
		self.hide()
		grid_slots.slots_update()

#-----------------------------------物品描述--------------------------------------
func show_description(where:int):
	if(!selected):
		description.update_description(where)
		description_visible=true
		description.show()

func hide_description():
	if(!selected):
		description_visible=false
		description_cd.start()

func _on_description_cd_timeout():
	if(!description_visible):
		description.hide()

#----------------------------------选择-----------------------------------------
func show_tips(where:int):
	tips.global_position=get_global_mouse_position()
	description.update_description(where)
	tips.update_tips(where)
	tips.show()
	selected=true
	description.show()

func _on_cancel_pressed():
	hide_tips()

func hide_tips():
	grid_slots.get_child(tips.current_slot).hide_tips()
	tips.current_slot=-1
	tips.hide()
	selected=false
	description.hide()
