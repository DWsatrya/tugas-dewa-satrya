extends Node

signal score_changed(value)
signal coins_changed(value)
signal lives_changed(value)

var score := 0
var coins := 0
var lives := 5

func add_score():
	score += 1
	score_changed.emit(score)

func add_coin():
	coins += 1
	coins_changed.emit(coins)

func lose_life():
	lives -= 1
	lives_changed.emit(lives)

	if lives <= 0:
		print("Anda mati!")

		# Reset nyawa ke 5
		lives = 5
		lives_changed.emit(lives)

		# Muat ulang scene
		get_tree().reload_current_scene()
