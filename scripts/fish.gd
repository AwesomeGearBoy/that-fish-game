extends CharacterBody2D
class_name Fish

var face_left := false
var last_rotation := 0.0
var last_key := "d"
const BASE_SPEED := 400
const SPRINT_SPEED := 800

func keyDown(key) -> bool:
	if Input.is_action_pressed(key):
		return true
	else:
		return false

func keyWentDown(key) -> bool:
	if Input.is_action_just_pressed(key):
		return true
	else:
		return false

func keyWentUp(key) -> bool:
	if Input.is_action_just_released(key):
		return true
	else:
		return false

func _process(delta):
	var direction := Input.get_vector("a", "d", "w", "s")
	var speed = BASE_SPEED
	if keyDown("shift"):
		speed = SPRINT_SPEED
	velocity = direction * speed
	move_and_slide()
	if keyWentDown("a") && last_key == "d":
		scale.x = -1
		last_key = "a"
	if keyWentDown("d") && last_key == "a":
		scale.x = -1
		last_key = "d"
	if velocity.length() == 0:
		rotation = last_rotation
	else:
		rotation = velocity.angle()
		last_rotation = rotation
