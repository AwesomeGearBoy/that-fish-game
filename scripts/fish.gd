extends CharacterBody2D

var face_left := false
var lastRotation := 0.0
var lastKey := "d"
const BASE_SPEED := 400
const SPRINT_SPEED := 800

func _process(delta):
	# HANDELING FISH MOVEMENT
	var direction := Input.get_vector("a", "d", "w", "s")
	var speed = BASE_SPEED
	if Input.is_action_pressed("shift"):
		speed = SPRINT_SPEED
	velocity = direction * speed
	move_and_slide()
	if Input.is_action_just_pressed("a") && lastKey == "d":
		scale.x = -1
		lastKey = "a"
	if Input.is_action_just_pressed("d") && lastKey == "a":
		scale.x = -1
		lastKey = "d"
	if velocity.length() == 0:
		rotation = lastRotation
	else:
		rotation = velocity.angle()
		lastRotation = rotation
	
