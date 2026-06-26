extends Node

# Data global
var coins: int = 0
var lives: int = 3

# Signal agar UI bisa update otomatis
signal coins_changed(new_coins)
signal lives_changed(new_lives)

func add_coin() -> void:
	coins += 1
	emit_signal("coins_changed", coins)

func lose_life() -> void:
	lives -= 1
	emit_signal("lives_changed", lives)
	if lives <= 0:
		game_over()

func game_over() -> void:
	print("Game Over!")
