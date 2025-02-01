extends CanvasLayer

var cont = 0

func _on_Button1_pressed():
	print("Botão 1 clicado!")
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Panel/MarginContainer/VBoxContainer/MGNome/Nome.text = $"../BD_dialogos".Leshy.name
	$Panel/MarginContainer/VBoxContainer/Dialogo.text = $"../BD_dialogos".Leshy.fala[cont]
	$TextureRect2.texture.resource_path = "res://UI/Assets/coelhinho 1.png"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Panel/Button.pressed and cont != ($"../BD_dialogos".Leshy.fala.size()-1):
		cont = (cont + 1) % $"../BD_dialogos".Leshy.fala.size()
		if cont == 1:
			$TextureRect2.texture.resource_path = "res://UI/Assets/coelhinho 2.png"
	elif cont == ($"../BD_dialogos".Leshy.fala.size()-1):
		$"..".current_state = $"..".state.COMBATE
		pass
	pass
	
