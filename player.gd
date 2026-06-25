extends CharacterBody2D

@onready var health = $Health
@export var KECEPATAN_JALAN: float = 200.0
@export var TEKANAN: float = 400.0
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
var hadap_kanan : bool = true


func _physics_process(delta: float) -> void:
	var ARAH_JALAN = Input.get_axis("jalan_kiri", "jalan_kanan")
	velocity.x = ARAH_JALAN * KECEPATAN_JALAN
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("loncat") and is_on_floor():
		velocity.y -= TEKANAN


	if velocity.x > 0 and !hadap_kanan:
		flip()
	if velocity.x < 0 and hadap_kanan:
		flip()
		
	apdet_animasi()
	move_and_slide()

func apdet_animasi():
	if not is_on_floor():
		anim.play("jump")
	elif velocity.x != 0:
		anim.play("walk")
	else:
		anim.play("idle")

func flip():
	scale.x *= -1
	hadap_kanan = !hadap_kanan
