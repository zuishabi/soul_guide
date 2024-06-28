extends PanelContainer

var cd:float
var skill:Skill

func update_ui(skill:Skill):
	$SkillTexture.texture=skill.skill_texture
	cd=skill.skill_cd
	self.skill=skill
	skill.excute_start.connect(in_cd)

func in_cd():
	skill.can_excute=false
	$ProgressBar.show()
	var tween:Tween=create_tween()
	tween.tween_property($ProgressBar,"value",100,cd).from(0)
	await tween.finished
	skill.can_excute=true
	$ProgressBar.hide()
	skill.excute_request.emit(skill)

