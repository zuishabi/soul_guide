extends Node

signal transmit_tips(content:String)

func update_tips(content:String):
	transmit_tips.emit(content)
