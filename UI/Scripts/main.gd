extends CanvasLayer

enum state{
	DIALOGO,
	COMBATE,
	MENU,
	WANDER
}

var current_state

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_state = state.WANDER
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current_state == state.DIALOGO:
		$PlayerUI.visible = false
		$Dialogo.visible = true
	elif current_state == state.COMBATE:
		$PlayerUI.visible = true
		$Dialogo.visible = false
	pass
