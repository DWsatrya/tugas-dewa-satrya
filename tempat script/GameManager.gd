extends Node

signal coins_changed(value)
signal lives_changed(value)

const MAX_LIVES := 5

var coins: int = 0
var lives: int = MAX_LIVES




func add_coin():
	coins += 1
	coins_changed.emit(coins)


func lose_life():
	lives -= 1
	lives_changed.emit(lives)

	if lives <= 0:
		game_over()


func game_over():
	print("Anda mati!")

	# Reset semua data
	coins = 0
	lives = MAX_LIVES

	# Update UI
	coins_changed.emit(coins)
	lives_changed.emit(lives)

	# Reload scene dengan aman
	call_deferred("_reload_scene")


func _reload_scene():
	get_tree().reload_current_scene()
