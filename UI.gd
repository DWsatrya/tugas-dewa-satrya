extends CanvasLayer

func _ready() -> void:
	var label_lives = $VBoxContainer/LabelLives
	var label_coins = $VBoxContainer/LabelCoins
	
	label_lives.text = "Nyawa: " + str(GameManager.lives)
	label_coins.text = "Koin: " + str(GameManager.coins)
	
	GameManager.lives_changed.connect(func(val): label_lives.text = "Nyawa: " + str(val))
	GameManager.coins_changed.connect(func(val): label_coins.text = "Koin: " + str(val))
