extends Camera2D

var can_move:bool=true

func _input(event):
	if(event is InputEventMouseMotion and can_move):
		$".".global_position=get_global_mouse_position()
