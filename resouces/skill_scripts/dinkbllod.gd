class_name DrinkBlood
extends Skill

func effect():
	var effects_player:Array[Effect]
	var effects_enemy:Array[Effect]
	var player_effect:Effect=EBGenerator.create_effect(Effect.effects.HEAL,10)
	effects_player.append(player_effect)
	var enemy_effect:Effect=EBGenerator.create_effect(Effect.effects.ATTACK,10)
	effects_enemy.append(enemy_effect)
	BattleManager.play_animation.emit("drinkblood")
	await Ui.animation_finished
	EnemyEffectManager.process_effect(effects_enemy)
	PlayerEffectManager.process_effect(effects_player)
