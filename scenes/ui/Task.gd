extends Control

@onready var panel_container = $PanelContainer

func show_animation():
	self.show()
	var tween:Tween=create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.tween_property(panel_container,"position",Vector2(255,0),0.5).from(Vector2(255,-500))

func hide_animation():
	var tween:Tween=create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.tween_property(panel_container,"position",Vector2(255,-500),0.5)
	await tween.finished
	self.hide()

func update_information():
	if(visible):
		hide_animation()
	else:
		show_animation()
