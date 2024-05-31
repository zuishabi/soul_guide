extends Control

signal label_init(health:int)
@onready var panel_container = $PanelContainer
@onready var label =$PanelContainer/VBoxContainer/Name

@export var label_1:String

func init(max_health:int):
	$PanelContainer/VBoxContainer/HBoxContainer/Health.text=str(max_health)

func _ready():
	label_init.connect(init)
	label.text=label_1
	panel_container.pivot_offset=Vector2(panel_container.size.x/2,panel_container.size.y/2)
	self.global_position.y=$"../..".global_position.y-20

func on_mouse_entere_entity():
	panel_container.show()
	var tween=create_tween()
	tween.set_parallel()
	tween.set_trans(Tween.TRANS_BACK)
	tween.tween_property(panel_container,"scale",Vector2(1,1),0.1).from(Vector2(0,0))

func on_mouse_exit_entity():
	panel_container.hide()
