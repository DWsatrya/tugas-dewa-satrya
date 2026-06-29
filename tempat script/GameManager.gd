extends Node

signal score_changed(value)
signal coins_changed(value)
signal lives_changed(value)

const MAX_LIVES := 5

var score := 0
var coins := 0
var lives := MAX_LIVES


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
		reset_game()
		get_tree().reload_current_scene()


func reset_game():
	score = 0
	coins = 0
	lives = MAX_LIVES

	score_changed.emit(score)
	coins_changed.emit(coins)
	lives_changed.emit(lives)
