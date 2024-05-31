extends Node

signal health_change(value)
signal magic_change(value)

var player_pos:Vector2i
var health:int:
	set(value):
		health=value
		health_change.emit(value)
var magic:int:
	set(value):
		magic=value
		magic_change.emit(value)
#最大生命值
var max_health:int=100
#最大法力值
var max_magic:int=50
