extends Area2D

signal eaten
var gunk_delay := 50
const GUNK_SPEED := 50

func _ready():
	reset_gunk()

func _process(delta):
	gunk_delay = randi_range(50, 100)
	position.y = position.y + GUNK_SPEED * delta
	if position.y >= 810 + gunk_delay:
		reset_gunk()

func reset_gunk():
	position.x = randi_range(25, 1415)
	position.y = -gunk_delay

func _on_body_entered(body):
	if body is Fish:
		eaten.emit()
		reset_gunk()
