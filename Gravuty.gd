extends Area2D




func _on_Gravity_body_entered(body):
	if body.is_in_group("Players"):
		$CollisionShape2D.set_deferred("disabled", true)
		$AnimationPlayer.play("Collect")
		body.add_gravity()
	


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
