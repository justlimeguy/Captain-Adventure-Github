extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -350.0
@onready var particles: AnimatedSprite2D = $Particles
@onready var player_animatios: AnimatedSprite2D = $PlayerAnimatios

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	
func animations_and_particles():
	pass
