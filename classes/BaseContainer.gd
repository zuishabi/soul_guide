#在开始界面的物品
class_name BaseContainer
extends Control

@onready var label = $Label

func _on_panel_container_mouse_entered():
	label.show()
	var tween=create_tween()
	tween.set_parallel()
	tween.set_trans(Tween.TRANS_BACK)
	tween.tween_property(label,"scale",Vector2(1,1),0.1).from(Vector2(0,0))

func _on_panel_container_mouse_exited():
	label.hide()
