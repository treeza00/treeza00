extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(get_node_or_null("hitbox")):
		get_node("hitbox").monitorable = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func monitor():
	if(get_node_or_null("hitbox")):
		print("monitor")
		get_node("hitbox").set_deferred("monitorable", true)
