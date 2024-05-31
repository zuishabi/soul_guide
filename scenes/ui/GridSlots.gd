extends GridContainer

var slots:Array
func _ready():
	BagManager.on_bag_changed.connect(slots_update)
	slots=get_children()
	slots_update()

func slots_update():
	var size=0
	for i in slots:
		i.margin_container.hide()
	for i in BagManager.inventory:
		slots[size].slot_update(size)
		size+=1
