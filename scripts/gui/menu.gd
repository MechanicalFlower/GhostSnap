class_name Menu
extends Control

# Use to forward the signal from easy_menu
signal start_game_pressed

@onready var easy_menu: Control = get_node(^"%EasyMenu")
@onready var title: Label = easy_menu.get_node(^"Content/Title")


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	easy_menu.connect(&"start_game_pressed", _on_Menu_start_game_pressed)

	var args = OS.get_cmdline_user_args()
	var level_idx: int = args.find("--level")
	if level_idx >= 0:
		var level = int(args[level_idx + 1])
		get_tree().change_scene_to_file("res://scenes/levels/level%d.tscn" % level)


func _on_Menu_start_game_pressed():
	await Fade.fade_out(1, Color.BLACK, "Diamond", false, false).finished
	get_tree().change_scene_to_file("res://scenes/levels/level1.tscn")
