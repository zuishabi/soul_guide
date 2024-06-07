class_name Equipment
extends Item

enum craft_kind{craft,da}

@export var equipment_kind:BagManager.equipments_kind#如果是装备，则装备的位置
@export var attack:int#装备的攻击力
@export var armour:int#装备的穿甲
@export var fire_attack:int#火属性攻击力
@export var water_attack:int#冰属性攻击力
@export var defense:int#装备的防御值
@export var craft:craft_kind#装备的工艺属性
