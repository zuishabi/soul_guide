extends Node

var base_effect=preload("res://resouces/effects/BaseEffect.tres")

func create_effect(kind:Effect.effects,value:int)->Effect:
	var new_effect=base_effect.duplicate()
	new_effect.effect=kind
	new_effect.value=value
	return new_effect
