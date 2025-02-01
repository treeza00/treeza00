por enquanto as classe criadas foram:
actor{
	só o player pertence a essa classe por enquanto,
	funcao vai definir elementos que vao possuir vida, velocidade
	posteriormente, os inimigos também serão actors
}
skill{
	todos os skills vao pertencer a essa classe
	além disso, eles precisam de uma imagem para UI
	é necessário:
		const ICON = preload("caminho para o arquivo do ícone") #pode ser o ícone do godot de placeholder até ter algum
		func _init() -> void:#inicializacao do skill
			set_name("nome_do_skill_entre_underlines")
			set_cargas(int: numero de cargas)
		func cast(player_postion:Vector3, mouse_position:Vector3, root:Node3D):
				#aqui deve estar contido o que acontece quando o player casta a skill, muitas vezes ele ira instanciar alguma cena
				#(a skill de parede instancia uma cena de parede, a skill de push, instancia uma área 2d que chega se há algo empurravel e empurra se sim)
	todos os scripts de skill devem chamar ("s_" + "nomedaskill")
}
