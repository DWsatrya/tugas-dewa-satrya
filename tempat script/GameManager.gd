extends Node

var score = 0
var coins = 0
var lives = 5

func add_score() -> void:
	score += 1
	print("Total score: ", score)

func add_coin() -> void:
	coins += 1
	print("Total coin: ", coins)

func lose_life() -> void:
	lives -= 1
	print("Health player: ", lives)
	if lives <= 0:
		print("Anda mati!")
		get_tree().reload_current_scene()
