extends CharacterBody3D
class_name Actor

@export var Max_Health:float = 30
@export var Speed:float = 13

var Health:float

func take_dmg(dmg: float):
	Health = Health - dmg
	print("health: ", Health)
	if Health <= 0:
		die()

func die():
	queue_free()
