class_name Enemy
extends Node2D

@export var max_health:int

var health:int

func _ready():
	health=max_health
	$Components/EntityLabel.label_init.emit(max_health)
