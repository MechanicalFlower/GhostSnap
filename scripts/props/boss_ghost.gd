class_name BossGhost
extends Ghost

@onready var health = get_node("Health")


func flashed() -> void:
	health.value -= 0.2

	if health.value <= 0.1:
		queue_free()
		GlobalSignal.trigger_signal(&"redacted", [false])

	if health.value <= 0.7:
		speed *= 2

	if health.value <= 0.5:
		GlobalSignal.trigger_signal(&"redacted", [true])

	timer.stop()
	get_dir()
