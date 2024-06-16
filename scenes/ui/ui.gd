extends CanvasLayer

@onready var description = $Description
@onready var task = $Task
@onready var bag = $Bag
@onready var chest_open = $ChestOpen

signal on_chest_open_finished

func show_description(position:Vector2,item:Item):
	description.update_description(position,item)

func update_player_information():
	task.update_information()

func show_bag():
	bag.show_bag()

func show_player_information():
	bag.show_bag()
	bag.show_player_information()

func chest_open_play(item_array:Array[Item]):
	chest_open.ani_play(item_array)

func _on_button_pressed():
	on_chest_open_finished.emit()
	chest_open.hide()
