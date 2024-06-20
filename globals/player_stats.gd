extends Node

signal health_change(value)
signal magic_change(value)
signal on_player_properties_changed
signal on_player_stats_changed

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
#攻击值
var attack:int=10
#防御值
var defense:int=5
#穿甲值
var armour:int=0
#属性攻击
var fire_attack:int=0
var water_attack:int=0

func _ready():
	on_player_properties_changed.connect(update_player_stats)

func update_player_stats(kind:Array[String],value:Array[int]):
	for i in kind.size():
		match kind[i]:
			"max_health":
				max_health+=value[i]
			"max_magic":
				max_magic+=value[i]
			"defense":
				defense+=value[i]
			"attack":
				attack+=value[i]
			"armour":
				armour+=value[i]
			"fire_attack":
				fire_attack+=value[i]
			"water_attack":
				water_attack+=value[i]
	on_player_stats_changed.emit()

func show_properties():
	print("max_health: "+str(max_health))
	print("max_magic: "+str(max_magic))
	print("defense: "+str(defense))
	print("attack: "+str(attack))
	print("armour: "+str(armour))
