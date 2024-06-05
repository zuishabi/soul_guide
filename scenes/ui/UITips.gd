extends Control

@onready var rich_text_label =$PanelContainer/VBoxContainer/RichTextLabel

func _ready():
	TipsEmitter.transmit_tips.connect(show_tips)

func show_tips(content:String):
	update_tips(content)
	self.show()

func update_tips(content:String):
	rich_text_label.add_text(content)

func hide_tips():
	rich_text_label.clear()
	self.hide()

func _on_button_pressed():
	hide_tips()
