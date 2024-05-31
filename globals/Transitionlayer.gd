extends CanvasLayer

@onready var animation_player=$AnimationPlayer

func change_to_scene(path:String):
	animation_player.play("fade_to_black")
	get_tree().change_scene_to_file(path)
	animation_player.play_backwards("fade_to_black")
