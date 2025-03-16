extends CharacterBody2D

func _physics_process(delta):
	move_and_slide()
	#var collision = move_and_collide(velocity * delta)


func _on_hurtbox_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage()
