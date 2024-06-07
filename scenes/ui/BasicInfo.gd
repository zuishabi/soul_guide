extends HBoxContainer

@onready var attack = $Attack
@onready var defense = $Defense
@onready var armour = $Armour

func basic_update(item:Equipment):
	if(item.equipment_kind==BagManager.equipments_kind.MAINHAND||item.equipment_kind==BagManager.equipments_kind.OFFHAND):
		attack.show()
		armour.show()
		defense.hide()
		attack.update(item.attack)
		armour.update(item.armour)
	else:
		attack.hide()
		armour.hide()
		defense.show()
		defense.update(item.defense)
