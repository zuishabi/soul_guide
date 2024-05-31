extends BaseContainer

func _on_panel_container_gui_input(_event):
	if Input.is_action_pressed("mouse_left"):
		PlayerStats.health=PlayerStats.max_health
		PlayerStats.magic=PlayerStats.max_magic
		Global.is_in_dungeon=true
		Transitionlayer.change_to_scene("res://scenes/Base/base.tscn")
