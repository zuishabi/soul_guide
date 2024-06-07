extends MarginContainer

@export var icon:Texture

@onready var texture = $HBoxContainer/Texture
@onready var label = $HBoxContainer/Label

func _ready():
	texture.texture=icon

func update(value:int):
	label.text=str(value)
