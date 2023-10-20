extends Node2D
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#
#	$AnimationPlayer.play("Clouds")
#	$BgImage/Water.play("default")
#	if Input.is_action_just_pressed("esc") && Gvars.is_paused == false:
#		pause()
#	if Input.is_action_pressed("jump") && Gvars.is_paused == true:
#		resume()
#
#
#func _on_pause_pressed():
#	pause()
#	$"Pause Menue/Pause".disabled = true
#func _on_resume_pressed():
#	resume()
#	$"Pause Menue/Pause".disabled = false
#func _on_menue_pressed():
#	get_tree().change_scene_to_file("res://Scenes/MainMenue.tscn")
#	Engine.time_scale = 1
#	Gvars.is_allowed_to_press = true
#	Gvars.is_paused = false
#
#func _on_quit_pressed():
#	get_tree().quit()
#
#
#func _on_restart_pressed():
#	get_tree().reload_current_scene()
#	Engine.time_scale = 1
#	Gvars.is_paused = false
#	Gvars.is_allowed_to_press = true
#
#
#
#func pause():
#
#	$"Pause Menue/Pause".visible = !$"Pause Menue/Pause".visible
#	Engine.time_scale = 0
#	Gvars.is_allowed_to_press = false
#	Gvars.is_paused = true
#
#func resume():
#	$"Pause Menue/Pause".visible = !$"Pause Menue/Pause".visible
#	Engine.time_scale = 1
#	Gvars.is_allowed_to_press = true
#	Gvars.is_paused = false
