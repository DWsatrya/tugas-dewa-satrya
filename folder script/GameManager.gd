extends Node
var score = 0
var coins = 0
var live = 5

func add_score() -> void:
	score += 1
	print ("total score :", score)
func add_coins() -> void:
	coins += 1
	print ("total coin", coins)
func lose_life() -> void:
	live -= 1
	print ("health player", live)
	
	if live <= 0:
		print("anda mati")
		

	
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
