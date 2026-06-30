extends Node

signal score_changed(value)
signal coins_changed(value)
signal lives_changed(value)

var score: int = 0
var coins: int = 0
var lives: int = 5

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

		# Reset nyawa
		lives = 5
		lives_changed.emit(lives)

		# Reload scene dengan aman
		call_deferred("_reload_scene")


func _reload_scene():
	get_tree().reload_current_scene()
