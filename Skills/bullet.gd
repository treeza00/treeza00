extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#set_contact_monitor(true)
	#set_max_contacts_reported(1)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	queue_free()
