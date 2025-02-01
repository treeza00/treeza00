extends Skill

const BULLET = preload("res://Skills/bullet.tscn")#cena a ser instanciada pelo cast
const ICON = preload("res://Skills/icones/wall_icon.png")

const bullet_speed = 20

# Called when the node enters the scene tree for the first time.
func _init() -> void:
	set_name("shoot")
	set_cargas(7)

# cast da skill -> instancia uma wall.tscn
func cast(player_postion:Vector3, mouse_position:Vector3, root:Node3D):
	var dir = get_dir2d(player_postion, mouse_position)
	var b = BULLET.instantiate()
	root.add_child(b)
	b.global_position = player_postion + (Vector3(dir.x, 0, dir.y) * 2)
	b.set_linear_velocity(Vector3(dir.x, 0, dir.y)*bullet_speed)
	#b.set_rotation(Vector3(0, -dir.rotated(-PI/2).angle(), 0))
	cargas -= 1
