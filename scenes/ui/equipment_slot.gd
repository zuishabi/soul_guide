class_name EquipmentsSlots
extends BagSlots

func _ready():
	kind="EQUIPMENT"

func slot_update(where:int):
	self.where=where
	if(BagManager.equipments_inventory[where]):
		margin_container.show()
		texture_rect.texture=BagManager.equipments_inventory[where].item_texture
