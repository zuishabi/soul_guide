extends Node

func take_damage(damage:int):#受击
	PlayerStats.health=clampi(PlayerStats.health-damage,0,PlayerStats.max_health)

func add_hp(value:int):#增加生命
	PlayerStats.health=clampi(PlayerStats.health+value,0,PlayerStats.max_health)

func add_mp(value:int):#增加魔力
	PlayerStats.magic=clampi(PlayerStats.magic+value,0,PlayerStats.max_magic)
	
