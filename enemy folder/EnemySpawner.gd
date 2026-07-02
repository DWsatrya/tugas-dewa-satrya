extends Node2D

@export var jumlah_enemy: int = 1

var factory := preload("res://Enemies/EnemyFactory.gd").new()

func _ready():

	for i in jumlah_enemy:

		var enemy = factory.create_enemy()

		enemy.global_position = global_position

		get_parent().add_child.call_deferred(enemy)
