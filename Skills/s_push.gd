extends Skill

const PUSH_AREA = preload("res://Skills/push_area.tscn")#cena a ser instanciada pelo cast
const ICON = preload("res://Skills/icones/push_icon.png")

# Called when the node enters the scene tree for the first time.
func _init() -> void:
	set_name("push")
	set_cargas(5)

# cast da skill -> instancia uma push_area.tscn, que checa se há coisa empurráveis, e empurra se sim
func cast(player_postion:Vector3, mouse_position:Vector3, root:Node3D):
	var dir = get_dir2d(player_postion, mouse_position)#direcao que sera empurrada
	var push_area = PUSH_AREA.instantiate()
	push_area.set_dir2d(dir)
	root.add_child(push_area)
	push_area.global_position = player_postion + (Vector3(dir.x, 0, dir.y) * 2)#coloca a área perto do player na direção que a skill foi uzada
	cargas -= 1
