extends BaseUi

@onready var skill_g = $MainUi/SkillV/MarginContainer/SkillG
@onready var skill_description = $SkillDescription
@onready var animation_player = $AnimationPlayer
@onready var enemy_battle_texture = $EnemyBattleTexture

var skillui=preload("res://scenes/ui/SkillUi.tscn")

func _ready():
	BattleManager.start_battle_signal.connect(start_battle)
	BattleManager.play_animation.connect(play_animation)
	animation_player.animation_finished.connect(clear_animation)
	for i in animation_player.get_children():
		i.hide()

func start_battle(enemy:EnemyStats):
	enemy_battle_texture.update(enemy)
	for i in skill_g.get_children():
		i.queue_free()
	for i in BattleManager.get_player_skill():
		var new_skill_ui=skillui.instantiate()
		new_skill_ui.update_ui(i)
		skill_g.add_child(new_skill_ui)
		new_skill_ui.mouse_entered.connect(show_description.bind(new_skill_ui.skill))
		new_skill_ui.mouse_exited.connect(hide_description)
	Ui.show_ui("FightUi")

func show_ui():
	if self.visible:
		hide()
		Global.return_game()
	else:
		show()
		Global.stop_game()

func show_description(skill:Skill):
	skill_description.show()
	skill_description.update_description(skill)

func hide_description():
	skill_description.hide()

func play_animation(name:String):
	animation_player.play(name)

func clear_animation(name:String):
	Ui.animation_finished.emit()
	for i in animation_player.get_children():
		i.hide()
