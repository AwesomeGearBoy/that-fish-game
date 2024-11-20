extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("w"):
		print("Going up!")
	elif Input.is_action_pressed("a"):
		print("Going left!")
	elif Input.is_action_pressed("s"):
		print("Going down!")
	elif Input.is_action_pressed("d"):
		print("Going right!")
