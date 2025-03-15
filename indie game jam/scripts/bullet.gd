extends CharacterBody2D

func _physics_process(delta):
	move_and_slide()
	#var collision = move_and_collide(velocity * delta)
