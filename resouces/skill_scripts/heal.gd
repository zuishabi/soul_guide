class_name Heal
extends Skill

func effect():
	var effects:Array[Effect]
	var new_effect=EBGenerator.create_effect(Effect.effects.HEAL,10)
	effects.append(new_effect)
	BattleManager.play_animation.emit("heal")
	await Ui.animation_finished
	PlayerEffectManager.process_effect(effects)

func if_meet_condition()->bool:
	if(PlayerStats.health/PlayerStats.max_health<=0.8):
		return true
	else:
		return false
