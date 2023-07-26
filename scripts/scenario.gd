class_name Scenario
extends Node

var _music_played: bool = false

@onready var player = get_tree().get_nodes_in_group(&"player")[0]
@onready var music: MusicPlayer = get_parent().get_node("MusicPlayer")


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	await Fade.fade_in(1, Color.BLACK, "Diamond", false, false).finished


func _on_Area3D_body_entered(body):
	if not _music_played and body == player:
		music.play("ghosty")
		_music_played = true
