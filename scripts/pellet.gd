extends Area2D

signal collected
var pellet_delay := 50
const PELLET_SPEED := 200

func _ready():
	reset_pellet()

func _process(delta):
	pellet_delay = randi_range(50, 250)
	position.y = position.y + PELLET_SPEED * delta
	rotation_degrees = rotation_degrees + PELLET_SPEED * delta
	if position.y >= 810 + pellet_delay:
		reset_pellet()

func reset_pellet():
	position.x = randi_range(25, 1415)
	position.y = -pellet_delay

func _on_body_entered(body):
	if body is Fish:
		collected.emit()
		reset_pellet()
