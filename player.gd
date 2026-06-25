extends CharacterBody2D

@export var KECEPATAN_JALAN: float = 200.0
@export var TEKANAN: float = 400.0
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	print("Input kiri: ", Input.is_action_pressed("jalan_kiri"))
	print("Input kanan: ", Input.is_action_pressed("jalan_kanan"))
	
	var ARAH_JALAN = Input.get_axis("jalan_kiri", "jalan_kanan")
	velocity.x = ARAH_JALAN * KECEPATAN_JALAN
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("loncat") and is_on_floor():
		velocity.y -= TEKANAN

	apdet_animasi()
	move_and_slide()

func apdet_animasi():
	if not is_on_floor():
		anim.play("jump")
	elif velocity.x != 0:
		anim.play("jalan")
	else:
		anim.play("idle")
