class_name  Skill
extends Resource


@export var skill_texture:Texture2D
@export var skill_cd:float
@export var skill_name:String
@export_multiline var skill_description:String

signal excute_request
signal excute_start

var can_excute:bool=true
var locked:bool=false

func out_effect():
	excute_start.emit()
	effect()

func effect():
	pass

func if_meet_condition()->bool:
	return true
