extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -350.0

@onready var player_animatios: AnimationPlayer = $AnimationPlayer
@onready var sprite = $PlayerAnimatios

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var player_flipped : bool
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
	maual_flip()
func animations_and_particles():
	if velocity.x != 0 && is_on_floor():
		player_animatios.play("Run")
		
	if velocity.x == 0 && velocity.y == 0:
		player_animatios.play("Idle")
	if velocity.y > 0 && !is_on_floor():
		player_animatios.play("Fall")
	if velocity.y < 0 && Input.is_action_just_pressed("jump"):
		player_animatios.play("Jump")
	if Input.is_action_just_pressed("left"):
		player_flipped = true
	if Input.is_action_just_pressed("right"):
		player_flipped = false
func maual_flip():
	if player_flipped == true:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
