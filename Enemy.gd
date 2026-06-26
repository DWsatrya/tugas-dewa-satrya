extends CharacterBody2D

@export var kecepatan: float = 80.0
var arah: float = 1.0
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D  # tambah ini

func _physics_process(delta: float) -> void:
	velocity.x = kecepatan * arah
	velocity += get_gravity() * delta
	move_and_slide()

	anim.play("gerak_musuh")  # panggil animasi kamu disini

	if is_on_wall():
		arah *= -1
		scale.x *= -1

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.terkena_musuh()
