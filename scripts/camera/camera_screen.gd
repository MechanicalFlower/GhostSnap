extends MeshInstance3D

var Redacted: ShaderMaterial = load("res://resources/materials/camera/redacted.tres")


func _ready():
	GlobalSignal.add_listener(&"redacted", redacted)


func redacted(state: bool):
	if state:
		set_material_override(Redacted)
	else:
		set_material_override(null)
