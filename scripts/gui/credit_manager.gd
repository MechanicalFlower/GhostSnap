extends Node

const RightTemplate = preload("res://scenes/gui/credits/right_template.tscn")
const LeftTemplate = preload("res://scenes/gui/credits/left_template.tscn")

var _textures: Array[ImageTexture] = []


func _ready():
	GlobalSignal.add_listener(&"snap", add_picture)
	GlobalSignal.add_listener(&"credit", show_credit)


func add_picture(viewport: Viewport):
	var image: Image = viewport.get_texture().get_image()
	var texture = ImageTexture.create_from_image(image)
	_textures.append(texture)


func show_credit():
	get_tree().change_scene_to_file("res://scenes/gui/credits/credit.tscn")
