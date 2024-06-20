extends Control

func _ready():
	Global.on_game_start.connect(game_start)

func _on_panel_container_mouse_entered():
	$PanelContainer/Chest.play("default")

func _on_panel_container_mouse_exited():
	$PanelContainer/Chest.stop()

func _on_start_button_pressed():
	Global.game_start()
	Ui.initial_ui()

func game_start():
	hide()

func _on_settings_button_pressed():
	hide()
	$"../Settings".show()

func _on_exit_button_pressed():
	get_tree().quit()
