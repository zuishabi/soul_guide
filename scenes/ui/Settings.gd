extends Control

@onready var option_button = $VBoxContainer/HBoxContainer/OptionButton

func _ready():
	option_button.selected=0

func _process(_delta):
	pass

func _on_option_button_item_selected(index):
	Global.language=index

func _on_texture_button_pressed():
	hide()
	if Global.is_game_started:
		$"../InsideMenu".show()
	else:
		$"../StartMenu".show()
