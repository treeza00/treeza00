extends Node3D

var mouse_in = false
var player_in = false
var path:String
var player:Actor

@onready var sprite_3d: Sprite3D = $Sprite3D

func _process(delta: float) -> void:
	if mouse_in and player_in:
		sprite_3d.modulate = Color.RED
		if Input.is_action_just_pressed("ui_E"):
			if player.equiped_skill1.skill_name == "no_skill":
				player.equiped_skill1 = load(path).new()
				queue_free()
			elif player.equiped_skill2.skill_name == "no_skill":
				player.equiped_skill2 = load(path).new()
				queue_free()
	else:
		sprite_3d.modulate = Color.WHITE

func set_skill_path(p:String):
	path = p

func set_texture(p:String):
	sprite_3d.texture = load(p)

func _on_check_player_body_entered(body: Node3D) -> void:
	player_in = true
	player = body

func _on_check_player_body_exited(body: Node3D) -> void:
	player_in = false

func _on_check_player_mouse_entered() -> void:
	mouse_in = true

func _on_check_player_mouse_exited() -> void:
	mouse_in = false
