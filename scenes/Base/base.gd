extends Node2D

@onready var tile_map = $TileMap
@onready var mouse_target =$Sign/MouseTarget
@onready var target_place = $Sign/TargetPlace
@onready var player = $player
@onready var line_2d = $Sign/Line2D

var can_move:bool=true
var mouse_pos:Vector2#鼠标位置
var tile_pos:Vector2#当前鼠标在地图的位置
var global_pos:Vector2#将地图位置再转换成对应的全局位置
var target_pos:Vector2#目标位置
var astar:TileMapAStar2D
var can_reach_texture=preload("res://arts/2D Pixel Dungeon Asset Pack/gui/can_reach.png")
var can_fight_texture=preload("res://arts/2D Pixel Dungeon Asset Pack/gui/can_fightt.png")
var can_get_texture=preload("res://arts/2D Pixel Dungeon Asset Pack/gui/can_get.png")

signal target_arrive
#-------------------------------------------对内-----------------------------------------------------
func _ready():
	mouse_target.show()
	astar=TileMapAStar2D.new(tile_map,0)

func _process(_delta):
	mouse_pos=get_global_mouse_position()
	tile_pos=tile_map.local_to_map(to_local(mouse_pos))
	global_pos=tile_map.map_to_local(tile_pos)
	mouse_target.global_position=global_pos
	process_mouse_target()

func _input(event):
	if(event.is_action_pressed("mouse_left")&&can_move&&get_tile_data(tile_pos,0,"can_reach")):
		target_pos=tile_pos
		var target:String=get_target()
		can_move=false
		target_place.show()
		target_place.global_position=to_global(global_pos)
		var start=astar.get_closest_point(tile_map.local_to_map(player.position))
		var end=astar.get_closest_point(tile_map.local_to_map(global_pos))
		var path=astar.get_id_path(start,end)
		path.remove_at(0)
		for i in path:
			var point=astar.get_point_position(i)
			var next_point=tile_map.map_to_local(point)
			line_2d.add_point(next_point)
		var id=0
		for i in path:
			var point=astar.get_point_position(i)
			var next_point=tile_map.map_to_local(point)
			if(player.global_position.x>next_point.x):
				player.flip(0)
			elif(player.global_position.x<next_point.x):
				player.flip(1)
			var tween=create_tween()
			tween.tween_property(player,"position",next_point,0.18)
			await tween.finished
			line_2d.remove_point(id)
		process_target(target)
		target_place.hide()
		can_move=true

func get_tile_data(target_position:Vector2,layer:int,custom_data_layer:String):
	var tile_data:TileData=tile_map.get_cell_tile_data(layer,target_position)
	if tile_data:
		return tile_data.get_custom_data(custom_data_layer)
	else:
		return false

func process_mouse_target():
	if(get_tile_data(tile_pos,1,"can_interact")):
		mouse_target.texture=can_get_texture
		mouse_target.show()
	elif(get_tile_data(tile_pos,0,"is_enemy")):
		mouse_target.texture=can_fight_texture
		mouse_target.show()
	elif(get_tile_data(tile_pos,0,"can_reach")):
		mouse_target.texture=can_reach_texture
		mouse_target.show()
	else:
		mouse_target.hide()

func start_fight():
	pass

func get_target()->String:
	if(get_tile_data(target_pos,0,"is_enemy")):
		return "enemy"
	if(get_tile_data(target_pos,1,"can_interact")):
		return "can_interact"
	return ""

func process_target(target:String):
	if(target=="enemy"):
		start_fight()
	elif(target=="can_interact"):
		process_object()

func process_object():
	var object=get_tile_data(target_pos,1,"object")
	var new_object=object.new()
	new_object.excute()
