class_name Skill

var skill_name:String
var cargas:int

#const ICON = preload("res://Skills/icones/noicon.jpg")
#SEMPRE QUE FOR CRIAR UMA NOVA SKILL, PRECISA FAZER UMA CONST ICON COM O PATH PARA A IMAGEM QUE VAI SER CARREGADA


#funcao deve ser sobrescrita nos arquivos individuais de cada skill
func cast(player_postion:Vector3, mouse_position:Vector3, root:Node3D):
	pass

#gosto de usar a direcao em 2d pra n ter nenhum desvio indesejado em y
func get_dir2d(player_pos:Vector3, mouse_pos:Vector3)->Vector2:
	return (Vector2(mouse_pos.x - player_pos.x, mouse_pos.z - player_pos.z).normalized())

func get_dir3d(player_pos:Vector3, mouse_pos:Vector3)->Vector3:
	return (mouse_pos - player_pos).normalized()

func get_cargas()->int:
	return cargas
func set_cargas(c:int):
	cargas = c

func set_name(n:String):
	skill_name = n
func get_name()->String:
	return skill_name
