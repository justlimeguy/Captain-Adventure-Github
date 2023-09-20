extends CharacterBody2D

@export var speed : float = 500.0
@export var jump_velocity : float = -400.0
@export var double_jump_velocity : float = -350

@onready var ray_cast_2d = $RayCast2D
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var has_double_jumped : bool = false
var animation_locked : bool = false
var direction : Vector2 = Vector2.ZERO
var was_in_air : bool = false


func _process(delta):
	shoot_ray()
	if Input.is_action_just_pressed("left") || Input.is_action_just_pressed("right") && is_on_floor():
		play_audio(true)
	elif Input.is_action_just_released("left") || Input.is_action_just_released("right") || is_on_floor() == false:
		play_audio(false)
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		was_in_air = true

	elif animated_sprite.animation == "fall":
		velocity.y += gravity * 1000 * delta
		was_in_air = true

	else:
		has_double_jumped = false
		if was_in_air == true:
			land()
		was_in_air = false

	if Gvars.is_allowed_to_press == true:
		
		if Input.is_action_just_pressed("jump"):
			if is_on_floor():
				jump()
			elif not has_double_jumped:
				double_jump()
		
		direction = Input.get_vector("left", "right", "up", "down")
		
		if direction.x != 0 && animated_sprite.animation != "jump_end":
			velocity.x = direction.x * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)

		move_and_slide()
		update_animation()
		update_facing_direction()
	rayRead()
	playerState()


func update_animation():
	if not animation_locked:
		if not is_on_floor():
			animated_sprite.play("fall")
		else:
			if direction.x != 0:
				animated_sprite.play("run")
			else:
				animated_sprite.play("idle")


func update_facing_direction():
	if Input.is_action_just_pressed("right"):
		animated_sprite.flip_h = false
		ray_cast_2d.scale.x = abs(ray_cast_2d.scale.x) * 1
	elif Input.is_action_just_pressed("left"):
		animated_sprite.flip_h = true
		ray_cast_2d.scale.x = abs(ray_cast_2d.scale.x) * -1

func jump():
	velocity.y = jump_velocity
	animated_sprite.play("jump_start")
	animation_locked = true


func double_jump():
	velocity.y = double_jump_velocity
	animated_sprite.play("jump_start")
	animation_locked = true
	has_double_jumped = true


func land():
	animated_sprite.play("jump_end")
	animation_locked = true


func _on_animated_sprite_2d_animation_finished():
	if(["jump_end", "jump_start", "jump_start"].has(animated_sprite.animation)):
		animation_locked = false


func playerState():
	pass
func shoot_ray():
	if ray_cast_2d.is_colliding() == false:
		ray_cast_2d.target_position.x += 25
	if ray_cast_2d.is_colliding() == true:
		ray_cast_2d.target_position.x -= 25
func rayRead():
	var body = ray_cast_2d.get_collider()
	if ray_cast_2d.is_colliding() == true:
		pass
func play_audio(start : bool):
	while start:
		$AudioStreamPlayer.play()
		await $AudioStreamPlayer.finished
	if !start:
		$AudioStreamPlayer.stop()
