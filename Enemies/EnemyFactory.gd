extends Node

const SLIME = preload("res://Enemies/Slime.tscn")
const BAT = preload("res://Enemies/Bat.tscn")

func create_enemy() -> CharacterBody2D:
	if randi() % 2 == 0:
		return SLIME.instantiate()

	return BAT.instantiate()
