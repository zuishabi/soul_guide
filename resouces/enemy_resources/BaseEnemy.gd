class_name EnemyStats
extends Resource

signal health_changed(value)
@export var ai:PackedScene
@export var name:String
@export var enemy_texture:Texture
@export var loots:Loot
@export var max_health:int
@export var defense:int
@export var attack:int

var level:int
var health:int:
	set(value):
		health=value
		health_changed.emit(value)

func init():
	health=max_health
