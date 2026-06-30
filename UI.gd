extends CanvasLayer

@onready var label_lives = $VBoxContainer/LabelLives
@onready var label_coins = $VBoxContainer/LabelCoins

func _ready():
	label_lives.text = "Nyawa: " + str(GameManager.lives)
	label_coins.text = "Koin: " + str(GameManager.coins)

	if !GameManager.lives_changed.is_connected(_on_lives_changed):
		GameManager.lives_changed.connect(_on_lives_changed)

	if !GameManager.coins_changed.is_connected(_on_coins_changed):
		GameManager.coins_changed.connect(_on_coins_changed)


func _exit_tree():
	if GameManager.lives_changed.is_connected(_on_lives_changed):
		GameManager.lives_changed.disconnect(_on_lives_changed)

	if GameManager.coins_changed.is_connected(_on_coins_changed):
		GameManager.coins_changed.disconnect(_on_coins_changed)


func _on_lives_changed(value):
	label_lives.text = "Nyawa: " + str(value)


func _on_coins_changed(value):
	label_coins.text = "Koin: " + str(value)
