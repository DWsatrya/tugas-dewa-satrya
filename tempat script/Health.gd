extends Node

func kena_damage() -> void:
	GameManager.lose_life()

func keluar() -> void:
	get_tree().quit()
