extends PanelContainer

var current_slot:int=-1

func update_tips(where:int):
	if(current_slot!=-1&&current_slot!=where):
		get_parent().hide_tips()
	current_slot=where
