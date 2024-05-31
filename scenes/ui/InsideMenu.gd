extends Control

func _ready():
	pass

func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("exit")&&Global.is_game_started:
		if visible&&!Global.is_gaming:
			Global.is_gaming=true
			self.hide()
			get_tree().paused=false
		elif !visible&&Global.is_gaming:
			Global.is_gaming=false
			get_tree().paused=true
			self.show()

func _on_back_button_pressed():
	self.hide()
	get_tree().paused=false
	Global.is_gaming=true

func _on_settings_button_pressed():
	self.hide()
	$"../Settings".show()

func _on_main_menu_button_pressed():
	Global.is_game_started=false
	Global.is_gaming=false
	Global.is_in_dungeon=false
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	$".".hide()
	$"../StartMenu".show()

func _on_exit_button_pressed():
	get_tree().quit()
