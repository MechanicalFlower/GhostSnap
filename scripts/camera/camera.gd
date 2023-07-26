extends StaticBody3D

var _initial_pos = Vector3(0.767, -0.638, -1.029)
var _zoom_pos = Vector3(0.17, -0.359, -0.704)
var _zoom_state: bool = false

@onready var camera_player: Camera3D = get_viewport().get_camera_3d()
@onready var viewport: SubViewport = get_node("SubViewport")
@onready var camera: Camera3D = viewport.get_node("Camera3D")
@onready var anim: AnimationPlayer = get_node("AnimationPlayer")
@onready var audio: AudioStreamPlayer = get_node("AudioStreamPlayer")
@onready var player = get_tree().get_nodes_in_group(&"player")[0]


func _ready():
	position = _initial_pos


func _process(_delta):
	camera.global_transform = camera_player.global_transform


func _input(event):
	if event.is_action_pressed(&"interact") and not anim.is_playing():
		flashbang()

		var ghosts: Array[Node] = get_tree().get_nodes_in_group(&"ghost")
		for ghost in ghosts:
			if ghost.is_on_screen():
				var space = get_world_3d().direct_space_state
				var ray_query = PhysicsRayQueryParameters3D.create(
					ghost.global_position, player.global_position, 1 << 3
				)
				var raycast_result = space.intersect_ray(ray_query)

				if raycast_result.is_empty():
					GlobalSignal.trigger_signal(&"snap", [viewport])
					ghost.get_owner().flashed()

	if (
		event is InputEventMouse
		and event.is_pressed()
		and event.button_mask == MOUSE_BUTTON_MASK_RIGHT
	):
		var tween = get_tree().create_tween()
		tween.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if _zoom_state:
			tween.tween_property(self, "position", _initial_pos, 1)
		else:
			tween.tween_property(self, "position", _zoom_pos, 1)
		_zoom_state = !_zoom_state


func flashbang():
	anim.play(&"flashbang")
	audio.play()
