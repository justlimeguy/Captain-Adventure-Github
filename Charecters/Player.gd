extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -350.0

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
	animations_and_particles()
func animations_and_particles():
	if velocity.x != 0 && is_on_floor():
		player_animatios.play("run")
	if velocity.x == 0 && velocity.y == 0:
		player_animatios.play("idle")
	if velocity.y > 0 && !is_on_floor():
		player_animatios.play("fall")
	if velocity.y < 0 && Input.is_action_just_pressed("jump"):
		player_animatios.play("jump")
	if Input.is_action_just_pressed("left"):
		player_animatios.flip_h = true
	if Input.is_action_just_pressed("right"):
		player_animatios.flip_h = false
