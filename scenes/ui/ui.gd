extends CanvasLayer

signal animation_finished
@onready var description = $Description
@onready var task = $Task
@onready var bag = $Bag
@onready var chest_open = $ChestOpen
@onready var label = $Label
@onready var fight_ui = $FightUi

var focused_ui:String=""

func _process(delta):
	label.text=focused_ui

func initial_ui():
	focused_ui=""

func _input(event):
	if event.is_action_pressed("bag")&&(focused_ui==""||focused_ui=="Bag"):
		show_ui("Bag")
	if(event.is_action_pressed("m")&&(focused_ui==""||focused_ui=="Task")):
		show_ui("Task")
	if(event.is_action_pressed("exit")):
		if(focused_ui=="FightUi"):#如果当前聚焦ui为战斗ui
			pass
		else:
			if(focused_ui==""||focused_ui=="InsideMenu"):
				show_ui("InsideMenu")
			elif(get_node(focused_ui) is BaseUi):
				show_ui(focused_ui)

func show_ui(ui:String):
	get_node(ui).show_ui()
	if(focused_ui==""):
		focused_ui=ui
	else:
		focused_ui=""

func show_description(position:Vector2,item:Item):
	description.update_description(position,item)

func show_player_information():
	show_ui("Bag")
	bag.show_player_information()

func chest_open_play(item_array:Array[Item]):
	chest_open.ani_play(item_array)

func is_animation_playing()->bool:
	return $FightUi/AnimationPlayer.is_playing()
