extends Area3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_entered(area: Area3D) -> void:
	if area.name == "hitbox":
		var parent = get_parent()
		if parent is Actor:
			parent.take_dmg(area.dmg)
			area.q_free()
