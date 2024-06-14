class_name Equipment
extends Item

@export var equipment_kind:BagManager.equipments_kind#如果是装备，则装备的位置
@export var attack:int#装备的攻击力
@export var armour:int#装备的穿甲
@export var defense:int#装备的防御值
@export var craft:EquipmentPropertiesList.craft_kind#装备的工艺属性
@export_group("attribute_attack")
@export var fire_attack:int
@export var water_attack:int
