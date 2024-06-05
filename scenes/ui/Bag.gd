extends Control

@onready var grid_slots = $PanelContainer/VBoxContainer/HBoxContainer/Slots/GridSlots
@onready var description = $Description
@onready var description_cd = $Description_CD
@onready var tips = $tips

var selected:bool=false#是否有格子被选中
var description_visible
var equipments_slots:Array#存放所有的装备格子
var slots:Array#存放所有的物品格子

func _ready():
	slots=grid_slots.get_children()#获取所有的背包格子，并放在slots数组中
	for i:BagSlots in grid_slots.get_children():#遍历所有的背包格子，将格子中的信号连接到背包中
		i.show_information.connect(show_description)
		i.hide_information.connect(hide_description)
		i.show_tips.connect(show_tips)
	#获取所有的备格子，放在equipment_slots中
	equipments_slots.append_array($PanelContainer/VBoxContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/Equipments/Equip_1.get_children())
	equipments_slots.append_array($PanelContainer/VBoxContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/Equipments/Equip_2.get_children())
	for i:BagSlots in equipments_slots:#遍历所有的装备格子，并将其中的信号连接到背包中
		i.show_information.connect(show_description)
		i.hide_information.connect(hide_description)
		i.show_tips.connect(show_tips)
	BagManager.on_bag_changed.connect(slots_update)#将背包改变信号连接到刷新格子函数中，当背包改变时发出此信号，刷新ui层背包
	slots_update()

#刷新所有的格子
func slots_update():
	hide_description()
	hide_tips()
	var size=0
	for i in slots:
		i.margin_container.hide()
	for i in BagManager.inventory:
		slots[size].slot_update(size)
		size+=1
	size=0
	for i in equipments_slots:
		i.margin_container.hide()
	for i in BagManager.equipments_inventory:
		equipments_slots[size].slot_update(size)
		size+=1

func _input(event):
	if event.is_action_pressed("bag")&&Global.is_in_dungeon&&!self.visible&&!get_tree().paused:
		Global.is_gaming=false
		get_tree().paused=true
		self.show()
		slots_update()
	elif event.is_action_pressed("bag")&&Global.is_in_dungeon&&self.visible&&get_tree().paused:
		Global.is_gaming=true
		get_tree().paused=false
		self.hide()
		slots_update()

#退出按钮
func _on_texture_rect_gui_input(event:InputEvent):
	if event.is_action_pressed("mouse_left"):
		Global.is_gaming=true
		get_tree().paused=false
		self.hide()
		slots_update()

#-----------------------------------物品描述--------------------------------------
func show_description(where:int,kind:String):
	if(!selected):
		description.update_description(where,kind)
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
func show_tips(where:int,kind:String):
	tips.update_tips(where,kind)
	tips.global_position=get_global_mouse_position()
	description.update_description(where,kind)
	tips.show()
	selected=true
	description.show()

func hide_tips():
	if(tips.current_kind=="BAG"):
		grid_slots.get_child(tips.current_slot).hide_tips()#隐藏此格子的选中提示
	else:
		equipments_slots[tips.current_slot].hide_tips()
	tips.current_slot=-1
	tips.hide()
	selected=false
	description.hide()

