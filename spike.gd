extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Sebelum panggil GameManager")
		GameManager.lose_life()
		print("Sesudah panggil GameManager")
