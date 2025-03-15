extends Node2D

@onready var bulletScene = preload("res://scenes/bullet.tscn")

var maxBulletSpreadAngle : float = PI/24
var mousePos : Vector2
var mouseAngle : float
var cooldownFinished : bool = true

func _process(delta):

	
	# gets local mouse position and normalizes in range of (-1,-1 to 1,1)
	mousePos = get_local_mouse_position().normalized()
	# local mouse angled derived from mouse position
	mouseAngle = atan(mousePos.y/mousePos.x)
	
	# makes shotgun correctly follow the mouse
	%shotgunSprite.look_at(get_global_mouse_position())
	%shotgunSprite.flip_h = false
	
		# normalized vectors only range from -PI to PI, so adding this allows for full range of motion
	if mousePos.x < 0 :
		mouseAngle += PI
		%shotgunSprite.flip_h = true
		%shotgunSprite.rotation += PI
	
	
	
	if Input.is_action_pressed("shoot") && cooldownFinished : # TODO: && cooldowntimer
		cooldownFinished = false
		%cooldownTimer.start()
		for bulletsSpawned in 5:
			
			
			

			
			# spawn bullet
			var bullet = bulletScene.instantiate()
			add_child(bullet) # change later ?
			
			# creates a random angle in range of the max bullet spread angle
			var randomAngle = randf_range(-maxBulletSpreadAngle, maxBulletSpreadAngle)
			
			var angleVector = Vector2(cos(randomAngle + mouseAngle), sin(randomAngle + mouseAngle))
			bullet.velocity = angleVector * 1000
		
	pass


func _on_cooldown_timeout():
	cooldownFinished = true
