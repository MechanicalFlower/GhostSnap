extends Node3D

@onready var screen = get_node("../ViewportQuad")


func _ready():
	GlobalSignal.add_listener(&"redacted", redacted)


func redacted(state: bool):
	visible = state

	# hack
	screen.position.x = -0.5
