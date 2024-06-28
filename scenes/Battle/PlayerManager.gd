extends Node

var buff_array:Array
var skill_array:Array[Skill]
var request_array:Array[Skill]

func process_request(skill:Skill):
	request_array.append(skill)

func _process(delta):
	for i in request_array:
		if(i.if_meet_condition()&&!i.locked&&!Ui.is_animation_playing()):
			i.out_effect()
			request_array.erase(i)
