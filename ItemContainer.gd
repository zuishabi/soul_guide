extends PanelContainer

@onready var texture_rect = $TextureRect

func update_container(item_texture:Texture2D):
	texture_rect.texture=item_texture
