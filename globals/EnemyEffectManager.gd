extends Node

var enemy:EnemyStats

func take_damage(damage:int):#受击
	enemy.health=clampi(enemy.health-damage,0,enemy.max_health)

func add_hp(value:int):#增加生命
	enemy.health=clampi(enemy.health+value,0,enemy.max_health)

func add_mp(value:int):#增加魔力
	enemy.magic=clampi(enemy.magic+value,0,enemy.max_magic)

func process_effect(effects:Array[Effect]):
	for i in effects:
		match i.effect:
			Effect.effects.HEAL:
				add_hp(i.value)
			Effect.effects.ATTACK:
				take_damage(i.value)
			_:
				pass
