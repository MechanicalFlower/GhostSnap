class_name Overlay
extends Control

const MAX_LEVEL: int = 3

@export var level: int = 1

var _total_ghosts: int = 0

@onready var label_ghost = get_node("%LabelGhost")
@onready var label_level = get_node("%LabelLevel")


func _ready():
	label_level.set_text("%d / %d" % [level, MAX_LEVEL])


func _process(_delta):
	var num_ghosts = len(get_tree().get_nodes_in_group(&"ghost"))
	_total_ghosts = max(_total_ghosts, num_ghosts)
	label_ghost.set_text("%d / %d" % [_total_ghosts - num_ghosts, _total_ghosts])

	if _total_ghosts > 0 and 0 == num_ghosts:
		end_level()


func end_level():
	if _total_ghosts == 1:
		GlobalSignal.trigger_signal(&"credit")
	else:
		get_tree().change_scene_to_file("res://scenes/levels/level%d.tscn" % (level + 1))
