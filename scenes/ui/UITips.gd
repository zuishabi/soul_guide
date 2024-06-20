extends Control

var pre_ui:String
@onready var rich_text_label =$PanelContainer/VBoxContainer/RichTextLabel

func _ready():
	TipsEmitter.transmit_tips.connect(show_tips)

func show_tips(content:String):
	update_tips(content)
	Global.stop_game()
	pre_ui=Ui.focused_ui
	Ui.focused_ui="Tips"
	self.show()

func update_tips(content:String):
	rich_text_label.add_text(content)

func hide_tips():
	rich_text_label.clear()
	Ui.focused_ui=pre_ui
	Global.return_game()
	self.hide()

func _on_button_pressed():
	hide_tips()
