extends Node2D

@onready var tile_map = $TileMap
@onready var mouse_target =$Sign/MouseTarget
@onready var target_place = $Sign/TargetPlace
@onready var player = $player
@onready var line_2d = $Sign/Line2D

var can_move:bool=true
var mouse_pos
var tile_pos
var target_pos
var tile_id:int=1
var astar:TileMapAStar2D
var can_reach_texture=preload("res://arts/2D Pixel Dungeon Asset Pack/gui/can_reach.png")
var can_fight_texture=preload("res://arts/2D Pixel Dungeon Asset Pack/gui/can_fightt.png")
var can_get_texture=preload("res://arts/2D Pixel Dungeon Asset Pack/gui/can_get.png")

signal target_arrive
#-------------------------------------------对内-----------------------------------------------------
func _ready():
	mouse_target.show()
	PlayerStats.player_pos=player.global_position
	astar=TileMapAStar2D.new(tile_map,0)

func _process(_delta):
	mouse_pos=get_global_mouse_position()
	tile_pos=tile_map.local_to_map(to_local(mouse_pos))
	target_pos=tile_map.map_to_local(tile_pos)
	mouse_target.global_position=target_pos
	process_mouse_target()

func _input(event):
	if(event.is_action_pressed("mouse_left")):
		if can_move&&get_tile_data(tile_pos,0,"can_reach"):
			can_move=false
			target_place.show()
			target_place.global_position=target_pos
			var start=astar.get_closest_point(tile_map.local_to_map(player.position))
			var end=astar.get_closest_point(tile_map.local_to_map(target_pos))
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
				if(PlayerStats.player_pos.x>next_point.x):
					player.flip(0)
				elif(PlayerStats.player_pos.x<next_point.x):
					player.flip(1)
				var tween=create_tween()
				tween.tween_property(player,"position",next_point,0.18)
				await tween.finished
				tile_interact(point,1)
				PlayerStats.player_pos=player.position
				line_2d.remove_point(id)
			target_place.hide()
			can_move=true

func get_tile_data(target_position,layer,custom_data_layer):
	var tile_data:TileData=tile_map.get_cell_tile_data(layer,target_position)
	if tile_data:
		return tile_data.get_custom_data(custom_data_layer)
	else:
		return false

func tile_interact(tile_pos,layer):#处理地图物品
	var tile_data:TileData=tile_map.get_cell_tile_data(layer,tile_pos)
	if tile_data:
		if tile_data.get_custom_data("can_interact"):
			var object=tile_data.get_custom_data("object")
			if object:
				var data=object.new()
				data.excute()
				if(data.if_once):
					tile_map.erase_cell(layer,tile_pos)
	else:
		return

func process_mouse_target():
	if(get_tile_data(tile_pos,1,"can_handle")):
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

