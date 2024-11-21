extends Node

var menu := true
var game_running := false
var game_over := false
var score := 0
var final_score := 0
var high_score := 0
var lives := 3

func _ready():
	new_game()

func _process(delta):
	if !game_over && !menu:
		if Input.is_action_just_pressed("esc"):
			menu = true
			game_running = false
			game_over = false
	
	if lives >= 3:
		$Lives.text = "LIVES: 3"
	elif lives == 2:
		$Lives.text = "LIVES: 2"
	elif lives == 1:
		$Lives.text = "LIVES: 1"
	elif lives <= 0:
		$Lives.text = "LIVES: "
	
	if menu:
		$Menu.show()
	elif !menu:
		$Menu.hide()
	
	if lives <= 0:
		game_running = false
		game_over = true
	
	if game_over:
		$GameOver.show()
	else:
		$GameOver.hide()

func new_game():
	game_running = true
	game_over = false
	score = 0
	lives = 3
	$Fish.position.x = 200
	$Fish.position.y = 600
	$Score.text = "SCORE: " + str(score)
	randomize_pellets()
	randomize_gunk()

func randomize_pellets():
	$Pellet1.position.y = randi_range(-50, -500)
	$Pellet2.position.y = randi_range(-50, -500)
	$Pellet3.position.y = randi_range(-50, -500)
	$Pellet4.position.y = randi_range(-50, -500)
	$Pellet5.position.y = randi_range(-50, -500)
	$Pellet6.position.y = randi_range(-50, -500)
	$SuperPellet.position.y = randi_range(-500, -1000)

func randomize_gunk():
	$Gunk1.position.y = randi_range(-100, -500)
	$Gunk2.position.y = randi_range(-100, -500)

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

func _on_super_pellet_body_entered(body: Node2D) -> void:
	if body is Fish:
		score = score + 300
		$Score.text = "SCORE: " + str(score)

func _on_menu_start():
	new_game()
	menu = false

func _on_game_over_restart():
	new_game()

func _on_game_over_menu_press():
	menu = true
	game_running = false
	game_over = false
