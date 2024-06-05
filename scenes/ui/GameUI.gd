extends Control

func _ready():
	PlayerStats.health_change.connect(on_hp_changed)
	PlayerStats.magic_change.connect(on_mp_changed)
	Global.in_dungeon.connect(is_in_dungeon)

func on_hp_changed(_value):
	$HPBar.value=_value
	$HpLabel.text=str(PlayerStats.health)+"/"+str(PlayerStats.max_health)

func on_mp_changed(_value):
	$MPBar.value=_value
	$MpLabel.text=str(PlayerStats.magic)+"/"+str(PlayerStats.max_magic)

func is_in_dungeon(value:bool):
	if(value):
		show()
	else:
		hide()
