extends Area2D

func _ready():
	$AnimatedSprite2D.play("Idle")
func _on_body_entered(body):
	if body.name == "Player":
		$CollisionPolygon2D.disabled
		$AnimatedSprite2D.play("Pickup")
		await $AnimatedSprite2D.animation_finished
		queue_free()
