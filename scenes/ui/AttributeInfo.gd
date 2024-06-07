extends HBoxContainer

@onready var fire_attack = $FireAttack
@onready var water_attack = $WaterAttack

func update_attribute_info(item:Equipment):
	if(item.fire_attack!=0):
		fire_attack.show()
		fire_attack.update(item.fire_attack)
	else:
		fire_attack.hide()
	if(item.water_attack!=0):
		water_attack.show()
		water_attack.update(item.water_attack)
	else:
		water_attack.hide()
