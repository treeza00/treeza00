extends Node3D

@onready var timer: Timer = $Timer
const ABSORB_SKILL = preload("res://Skills/absorb_skill.tscn")

var skill_path:String
var icon_path:String

enum skill_list {no_skill, push, wall}

func _ready() -> void:
	timer.wait_time = randf_range(1,4)
	timer.start()
	set_skill()

func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	spawn_skill()
	timer.wait_time = randf_range(20,30)

func set_skill():
	var x = randi_range(1,skill_list.size())
	match x:
		1:
			skill_path = "res://Skills/s_push.gd"
			icon_path = "res://Skills/icones/push_icon.png"
		2:
			skill_path = "res://Skills/s_wall.gd"
			icon_path = "res://Skills/icones/wall_icon.png"
		3:
			skill_path = "res://Skills/s_shoot.gd"
			icon_path = "res://Skills/icones/wall_icon.png"

func spawn_skill():
	set_skill()
	var s = ABSORB_SKILL.instantiate()
	add_child(s)
	s.set_skill_path(skill_path)
	s.set_texture(icon_path)


func _on_child_exiting_tree(node: Node) -> void:
	if node.name == "absorb_skill":
		timer.start()
