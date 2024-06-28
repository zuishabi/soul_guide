extends Control

@onready var level = $Level
@onready var health = $health
@onready var texture_rect = $TextureRect
@onready var texture_progress_bar = $TextureProgressBar

var max_health:int

func update(enemy:EnemyStats):
	enemy.health_changed.connect(update_health)
	level.text=str(enemy.level)
	health.text=str(enemy.health)+'/'+str(enemy.max_health)
	max_health=enemy.max_health
	texture_rect.texture=enemy.enemy_texture
	texture_progress_bar.max_value=max_health

func update_health(value:int):
	var tween:Tween=create_tween()
	tween.tween_property(texture_progress_bar,"value",value,0.1)
	await tween.finished
	health.text=str(value)+'/'+str(max_health)
