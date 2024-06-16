extends Control

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var marker_2d = $Marker2D
@onready var item_box = $ItemBox
@onready var initial_pos = $InitialPos
@onready var button = $Button

var item_container=preload("res://scenes/ui/item_container.tscn")

func _ready():
	self.hide()

func ani_play(item_array:Array[Item]):
	for i in item_box.get_children():
		i.queue_free()
	self.show()
	button.hide()
	animated_sprite_2d.play("chest_open")
	await animated_sprite_2d.animation_finished
	show_items(item_array)

func show_items(item_array:Array[Item]):
	var item_size:int=item_array.size()
	var start_pos_x:int=marker_2d.position.x-(item_size*80+(item_size-1)*2)/2
	for i in item_array.size():
		var new_item=item_container.instantiate()
		var tween:Tween=create_tween()
		item_box.add_child(new_item)
		new_item.update_container(item_array[i].item_texture)
		tween.tween_property(new_item,"position",Vector2(start_pos_x,marker_2d.position.y),0.3).from(Vector2(initial_pos.position.x-40,initial_pos.position.y))
		await tween.finished
		start_pos_x+=80+2
	button.show()
