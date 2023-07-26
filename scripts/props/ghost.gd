class_name Ghost
extends StaticBody3D

enum Behavior { NOOP, DUMMY, RANDOM_WALKER, GO_AWAY }

@export var speed: int = 2
@export var behavior: Behavior = Behavior.NOOP

var _dir := Vector3.ZERO

@onready var player = get_tree().get_nodes_in_group(&"player")[0]
@onready var timer: Timer = get_node("Timer")


func _ready() -> void:
	if behavior == Behavior.NOOP:
		behavior = ((randi() % 3) + 1) as Behavior

	randomize()
	timer.connect(&"timeout", get_dir)
	get_dir()


func get_dir() -> void:
	if behavior == Behavior.RANDOM_WALKER:
		_dir = Vector3(get_rand_val(), 0.0, get_rand_val()).normalized()
	if behavior == Behavior.GO_AWAY:
		_dir = (global_position - player.global_position).normalized()
	timer.start(randf_range(0.5, 1))


func get_rand_val() -> float:
	return randf_range(-1, 1)


func _process(delta: float) -> void:
	move_and_collide(speed * _dir * delta)


func flashed():
	queue_free()
