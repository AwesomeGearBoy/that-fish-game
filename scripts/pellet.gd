extends Area2D

@export var parent_node: Node

signal collected
var parent := get_parent()
const PELLET_DELAY = 50
const PELLET_SPEED = 100

func _ready():
	reset_pellet()

func _process(delta):
	position.y = position.y + PELLET_SPEED * delta
	rotation_degrees = rotation_degrees + PELLET_SPEED * delta
	if position.y > 810 + PELLET_DELAY:
		reset_pellet()

func reset_pellet():
	position.x = randi_range(25, 1415)
	position.y = -PELLET_DELAY

func _on_body_entered(body):
	if body is Fish:
		if parent_node and parent_node.has_variable("score"):
			var parent = get_parent()  # Access the parent node
			if parent and parent.has_method("score_add"):  # Ensure the method exists
				parent.score_add(100)  # Call the parent's method to add to the score
