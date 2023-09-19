extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	play("default")
	$Reflexes.play("Reflex")
	$Reflexes2.play("Reflex")
	$Reflexes3.play("Reflex")



