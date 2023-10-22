extends Node2D


func _on_begining_area_body_exited(body: Node2D) -> void:
	if body.get_parent().name == "Player":
		$Player/Camera2D.limit_bottom = 1000

func _on_begining_area_body_entered(body: Node2D) -> void:
	if body.get_parent().name == "Player":
		$Player/Camera2D.limit_bottom = 500
