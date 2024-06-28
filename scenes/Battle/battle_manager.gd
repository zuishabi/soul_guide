extends Node

signal start_battle_signal
signal play_animation

@onready var enemy_manager = $EnemyManager
@onready var player_manager = $PlayerManager

func start_battle(enemy:EnemyStats):
	enemy_manager.enemy_stats=enemy
	enemy_manager.init_enemy()
	EnemyEffectManager.enemy=enemy
	update_player_skill()
	start_battle_signal.emit(enemy)
	for i:Skill in player_manager.skill_array:
		i.excute_request.emit(i)

func get_player_skill()->Array[Skill]:
	return player_manager.skill_array

func update_player_skill():
	player_manager.skill_array.clear()
	for i:Equipment in BagManager.equipments_inventory:
		if i!=null and i.skill.size()>0:
			for j in i.skill:
				var new_skill=j.duplicate(true)
				player_manager.skill_array.append(new_skill)
				if(!new_skill.excute_request.is_connected(player_manager.process_request)):
					new_skill.excute_request.connect(player_manager.process_request)
