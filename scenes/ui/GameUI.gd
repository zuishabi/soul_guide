extends Control

@onready var hp_bar = $HPBar
@onready var mp_bar = $MPBar

func _ready():
	PlayerStats.health_change.connect(on_hp_changed)
	PlayerStats.magic_change.connect(on_mp_changed)
	Global.in_dungeon.connect(is_in_dungeon)

func on_hp_changed(_value):
	var tween=create_tween()
	tween.set_trans(Tween.TRANS_CIRC)
	tween.tween_property(hp_bar,"value",_value,0.2)
	$HpLabel.text=str(PlayerStats.health)+"/"+str(PlayerStats.max_health)

func on_mp_changed(_value):
	var tween=create_tween()
	tween.set_trans(Tween.TRANS_CIRC)
	tween.tween_property(mp_bar,"value",_value,0.2)
	$MpLabel.text=str(PlayerStats.magic)+"/"+str(PlayerStats.max_magic)

func is_in_dungeon(value:bool):
	if(value):
		show()
	else:
		hide()

func _on_texture_rect_gui_input(event:InputEvent):
	if(event.is_action_pressed("mouse_left")):
		Ui.show_player_information()
