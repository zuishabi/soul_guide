extends Node

signal battle_start(enemy:EnemyStats)
var enemy:EnemyStats

func _ready():
	battle_start.connect(on_battle_start)

func on_battle_start(enemy:EnemyStats):
	self.enemy=enemy
