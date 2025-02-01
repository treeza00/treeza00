extends Skill
#skill equipada quando o player n tem nenhuma skill equipada
const ICON = preload("res://Skills/icones/noicon.jpg")

func _init() -> void:
	set_name("no_skill")
	set_cargas(0)

func cast(player_postion:Vector3, mouse_position:Vector3, root:Node3D):
	print("do nothing")
