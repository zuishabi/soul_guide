class_name attack
extends Skill

func effect():
	var effects:Array[Effect]
	var new_effect=EBGenerator.create_effect(Effect.effects.ATTACK,10)
	effects.append(new_effect)
	BattleManager.play_animation.emit("attack")
	await Ui.animation_finished
	EnemyEffectManager.process_effect(effects)

func if_meet_condition()->bool:
	return true
