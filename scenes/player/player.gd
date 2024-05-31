extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

func flip(num:int):
	if num==0:
		animated_sprite_2d.flip_h=true
	elif num==1:
		animated_sprite_2d.flip_h=false
