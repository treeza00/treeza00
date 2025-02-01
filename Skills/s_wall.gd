extends Skill

const WALL = preload("res://Skills/wall.tscn")#cena a ser instanciada pelo cast
const ICON = preload("res://Skills/icones/wall_icon.png")

# Called when the node enters the scene tree for the first time.
func _init() -> void:
	set_name("create_wall")
	set_cargas(2)

# cast da skill -> instancia uma wall.tscn
func cast(player_postion:Vector3, mouse_position:Vector3, root:Node3D):
	var dir = get_dir2d(player_postion, mouse_position)
	var wall = WALL.instantiate()
	root.add_child(wall)
	wall.global_position = player_postion + (Vector3(dir.x, 0, dir.y) * 2)
	wall.set_rotation(Vector3(0, -dir.rotated(-PI/2).angle(), 0))
	cargas -= 1
