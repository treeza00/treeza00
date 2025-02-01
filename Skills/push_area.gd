extends Area3D

var dir2d: Vector2
var push_force = 20.0

func _process(delta: float) -> void:
	pass

func _on_push_timer_timeout() -> void:
	queue_free()

func _on_body_entered(body: Node3D) -> void:
	var d3d = Vector3(dir2d.x, 0.1 ,dir2d.y)
	#body.set_linear_velocity(d3d * push_force)
	
	if body.has_method("monitor"):
		body.position.y += 0.1
		body.set_linear_velocity(d3d * push_force)
		print("has method")
		body.monitor()

func set_dir2d(d2d: Vector2):
	dir2d = d2d
