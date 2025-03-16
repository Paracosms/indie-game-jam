extends CharacterBody2D

@export var maxHealth : int = 10
var health : int = maxHealth

func _ready():
	%healthBar.max_value = maxHealth

func _physics_process(delta):
	if health <= 0 :
		queue_free()

func take_damage():
	health -= 1
	print(health)
	%healthBar.value = health
