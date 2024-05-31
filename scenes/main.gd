extends Node2D

func _ready():
	Global.on_game_start.connect(game_start)

func game_start():
	get_tree().paused=false
	get_tree().change_scene_to_file("res://scenes/StartScene/start_scene.tscn")
