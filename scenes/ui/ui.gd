extends CanvasLayer

@onready var description = $Description
@onready var task = $Task
@onready var bag = $Bag

func show_description(position:Vector2,item:Item):
	description.update_description(position,item)

func update_player_information():
	task.update_information()

func show_bag():
	bag.show_bag()

func show_player_information():
	bag.show_bag()
	bag.show_player_information()
