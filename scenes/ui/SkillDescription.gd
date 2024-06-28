extends PanelContainer

@onready var skill_name = $MarginContainer/VBoxContainer/Name
@onready var skill_description = $MarginContainer/VBoxContainer/SkillDescription

func update_description(skill:Skill):
	self.skill_name.text=skill.skill_name
	self.skill_description.text=skill.skill_description
