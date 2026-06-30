extends CharacterBody2D

@export var kecepatan: float = 80.0

var arah: float = 1.0
var can_turn: bool = true

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var ground_check: RayCast2D = $RayCast2D

enum State {
	PATROL,
	TURN
}

var current_state = State.PATROL

func _physics_process(delta: float) -> void:

	match current_state:
		State.PATROL:
			patrol(delta)

		State.TURN:
			turn()


func patrol(delta: float) -> void:

	velocity.x = kecepatan * arah
	velocity += get_gravity() * delta

	move_and_slide()

	anim.play("gerak_musuh")

	# Update RayCast agar hasilnya selalu terbaru
	ground_check.force_raycast_update()

	if can_turn:
		if is_on_wall():
			current_state = State.TURN

		elif !ground_check.is_colliding():
			current_state = State.TURN


func turn() -> void:

	can_turn = false

	# Balik arah jalan
	arah *= -1

	# Balik sprite
	scale.x *= -1

	# Tunggu sebentar agar tidak bolak-balik terus
	await get_tree().create_timer(0.2).timeout

	can_turn = true
	current_state = State.PATROL


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.terkena_musuh()
