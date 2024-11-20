extends Node

var score := 0

func _ready():
	pass

func _process(delta):
	print(score)

func score_add(amount: int):
	score = score + amount
