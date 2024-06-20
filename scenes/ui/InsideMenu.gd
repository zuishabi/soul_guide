extends BaseUi

func show_ui():
	if visible&&Global.is_game_started:
		Global.return_game()
		self.hide()
	elif !visible&&Global.is_game_started:
		Global.stop_game()
		self.show()

func _on_back_button_pressed():
	Ui.show_ui("InsideMenu")

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
