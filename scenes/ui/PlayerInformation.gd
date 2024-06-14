extends Sprite2D

@onready var information_panel = $InformationPanel

var show_position:Vector2=Vector2(-48,-48)
var hide_position:Vector2=Vector2(-48,-300)

func _ready():
	information_panel.position=hide_position
	PlayerStats.on_player_stats_changed.connect(box_update)
	hide()

func show_animation():
	show()
	var tween:Tween=create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(information_panel,"position",show_position,0.3).from(hide_position)

func hide_animation():
	var tween:Tween=create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(information_panel,"position",hide_position,0.3).from(show_position)
	await tween.finished
	hide()

func update_information():
	if(self.visible):
		hide_animation()
	else:
		show_animation()
		box_update()

func box_update():
	$InformationPanel/VBoxContainer/PlayerInformationBoxContainer/MaxHealth.update(PlayerStats.max_health)
	$InformationPanel/VBoxContainer/PlayerInformationBoxContainer/MaxMagic.update(PlayerStats.max_magic)
	$InformationPanel/VBoxContainer/PlayerInformationBoxContainer2/Defense.update(PlayerStats.defense)
	$InformationPanel/VBoxContainer/PlayerInformationBoxContainer2/Attack.update(PlayerStats.attack)
