extends Node
#----------------------------------变量----------------------------------------#
var language:int:
	set(value):
		if value==0:
			TranslationServer.set_locale("en")
		elif value==1:
			TranslationServer.set_locale("zh")
		language=value
var is_game_started:bool=false
var is_gaming:bool=false
var is_in_dungeon:bool=false:
	set(value):
		is_in_dungeon=value
		in_dungeon.emit(value)
var player_pos:Vector2i
#----------------------------------信号----------------------------------------#
signal on_game_start
signal enter_dungeon
signal in_dungeon(value)
#----------------------------------对外----------------------------------------#
func game_start():#当游戏开始时调用
	on_game_start.emit()
	is_game_started=true
	is_gaming=true
#----------------------------------对内----------------------------------------#
func _ready():
	language=0

