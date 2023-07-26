@tool
class_name Healthbar3D
extends Node3D

@export_range(0, 1) var value: float = 1:
	set = value_set
@export var full_color: Color = Color.GREEN:
	set = full_set
@export var empty_color: Color = Color.RED:
	set = empty_set
@export var outline_color: Color = Color.BLACK:
	set = outline_color_set
@export var size: Vector3 = Vector3(2, 1, 0.5):
	set = size_set
@export var outline_size: float = 0.1:
	set = outline_size_set
@export_enum("enabled", "y-fixed", "disabled") var billboard_mode: int = 2:
	set = billboard_set
@export var unshaded: bool = true:
	set = unshaded_set

var progress: MeshInstance3D
var origin: Node3D
var progress_origin: Node3D


func _init():
	progress = MeshInstance3D.new()
	origin = Node3D.new()
	progress_origin = Node3D.new()
	add_child(origin)
	origin.add_child(progress_origin)
	progress_origin.add_child(progress)
	progress.mesh = BoxMesh.new()
	progress.material_override = StandardMaterial3D.new()
	progress.material_override.params_billboard_keep_scale = true

	outline_color_set(outline_color)
	size_set(size)
	value_set(value)
	billboard_set(billboard_mode)
	unshaded_set(unshaded)


func value_set(val):
	value = val
	progress_origin.scale.x = value
	progress.material_override.albedo_color = empty_color.lerp(full_color, value)


func full_set(val):
	full_color = val
	value_set(value)


func empty_set(val):
	empty_color = val
	value_set(value)


func outline_color_set(val):
	outline_color = val


func size_set(val):
	size = val
	progress.mesh.size = size


func outline_size_set(val):
	outline_size = val
	size_set(size)


func billboard_set(val):
	billboard_mode = val
	match billboard_mode:
		0:
			progress.material_override.params_billboard_mode = StandardMaterial3D.BILLBOARD_ENABLED
		1:
			progress.material_override.params_billboard_mode = StandardMaterial3D.BILLBOARD_FIXED_Y
		2:
			progress.material_override.params_billboard_mode = StandardMaterial3D.BILLBOARD_DISABLED


func unshaded_set(val):
	unshaded = val
	progress.material_override.flags_unshaded = unshaded
