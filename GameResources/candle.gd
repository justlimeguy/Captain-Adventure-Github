extends AnimatedSprite2D

@export var light_colour : Color 

func _physics_process(delta: float) -> void:
	$Lights.color = light_colour
	play("default")
	if Input.is_action_just_pressed("grab"):
		detatched()
	if $Area2D.monitoring == true:
		for body in $Area2D.get_overlapping_bodies():
			if body.name == "Player":
				reparent(body, true)
				$Area2D.monitoring = false



func detatched():
	reparent($"../", true)
	$Area2D.monitoring = true

