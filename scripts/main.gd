extends Node

var score := 0

func _ready():
	pass

func _process(delta):
	pass

func add_to_score(amount: int):
	score += amount
	print("New score: ", score)
