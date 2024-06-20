extends Control

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var marker_2d = $Marker2D
@onready var item_box = $ItemBox
@onready var initial_pos = $InitialPos
@onready var button = $Button

var item_container=preload("res://scenes/ui/item_container.tscn")
var pre_ui:String
var items:Array[Item]

func _ready():
	self.hide()

func ani_play(item_array:Array[Item]):
	items=item_array
	Global.stop_game()
	pre_ui=Ui.focused_ui
	Ui.focused_ui="ChestOpen"
	for i in item_box.get_children():
		i.queue_free()
	self.show()
	button.hide()
	animated_sprite_2d.play("chest_open")
	await animated_sprite_2d.animation_finished
	show_items()

func show_items():
	var item_size:int=items.size()
	var start_pos_x:int=marker_2d.global_position.x-(item_size*80+(item_size-1)*2)/2
	for i in items.size():
		var new_item=item_container.instantiate()
		var tween:Tween=create_tween()
		item_box.add_child(new_item)
		item_box.global_position=Vector2(initial_pos.global_position.x-40,initial_pos.global_position.y)
		new_item.update_container(items[i].item_texture)
		tween.tween_property(new_item,"global_position",Vector2(start_pos_x,marker_2d.global_position.y),0.3)
		await tween.finished
		start_pos_x+=80+2
	button.show()

func _on_button_pressed():
	if(pre_ui==""):
		Global.return_game()
	for i in items:
		BagManager.add_item(i,1)
	Ui.focused_ui=pre_ui
	self.hide()
