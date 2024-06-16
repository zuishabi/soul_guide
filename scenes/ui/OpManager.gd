extends Control

@onready var line_edit = $VBoxContainer/HBoxContainer/LineEdit
@onready var rich_text_label = $VBoxContainer/RichTextLabel

func _input(event):
	if event.is_action_pressed("show_op")&&!self.visible:
		self.show()
	elif(event.is_action_pressed("show_op")&&self.visible):
		self.hide()

func _on_button_pressed():
	process_command(line_edit.text)

func process_command(command:String):
	if(command!=""):
		var parts=command.split(" ")
		if parts.size()<=0:
			return
		var cmd:String=parts[0]
		var args=parts.slice(1,parts.size())
		if not has_method(cmd):
			push_error("没有找到匹配的方法:",cmd)
			add_information("未找到此方法")
			line_edit.clear()
			return
		callv(cmd,args)
		line_edit.clear()

func add_item(item_name:String,count:String):
	BagManager.add_item(GlobalItemList.item_dictionary[item_name],int(count))
	add_information("成功添加 "+str(count)+"个"+item_name)

func delete_item(item_name:String,count:String):
	if BagManager.delete_item(GlobalItemList.item_dictionary[item_name],int(count)):
		add_information("成功删除 "+str(count)+"个"+item_name)
	else:
		add_information("删除失败")

func add_information(text:String):
	rich_text_label.add_text(Time.get_time_string_from_system()+':'+text)
	rich_text_label.newline()

func get_loot(loot_name:String,loot_num:String):
	LootsManager.get_loot(loot_name,int(loot_num))
