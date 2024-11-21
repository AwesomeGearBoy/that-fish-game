extends Node

var score := 0
var lives := 3

func _ready():
	new_game()

func _process(delta):
	pass

func new_game():
	score = 0
	$Fish.position.x = 200
	$Fish.position.y = 600
	$Score.text = "SCORE: " + str(score)
	randomize_pellets()

func randomize_pellets():
	$Pellet1.position.x = randi_range(-25, -50)
	$Pellet2.position.x = randi_range(-25, -50)
	$Pellet3.position.x = randi_range(-25, -50)
	$Pellet4.position.x = randi_range(-25, -50)
	$Pellet5.position.x = randi_range(-25, -50)
	$Pellet6.position.x = randi_range(-25, -50)

func randomize_gunk():
	$Gunk1.position.x = randi_range(-50, 100)

func _on_pellet_1_body_entered(body):
	if body is Fish:
		score = score + 100
		$Score.text = "SCORE: " + str(score)

func _on_pellet_2_body_entered(body):
	if body is Fish:
		score = score + 100
		$Score.text = "SCORE: " + str(score)

func _on_pellet_3_body_entered(body):
	if body is Fish:
		score = score + 100
		$Score.text = "SCORE: " + str(score)

func _on_pellet_4_body_entered(body):
	if body is Fish:
		score = score + 100
		$Score.text = "SCORE: " + str(score)

func _on_pellet_5_body_entered(body):
	if body is Fish:
		score = score + 100
		$Score.text = "SCORE: " + str(score)

func _on_pellet_6_body_entered(body):
	if body is Fish:
		score = score + 100
		$Score.text = "SCORE: " + str(score)

func _on_gunk_1_body_entered(body):
	if body is Fish:
		score = score - 500
		$Score.text = "SCORE: " + str(score)
		lives = lives - 1

func _on_gunk_2_body_entered(body):
	if body is Fish:
		score = score - 500
		$Score.text = "SCORE: " + str(score)
		lives = lives - 1
