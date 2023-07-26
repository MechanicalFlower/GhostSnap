@tool
extends MeshInstance3D

@export var speed: float = 1.0


func _process(delta):
	rotate_y(delta * speed)
