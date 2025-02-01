extends Actor
#

@onready var root_scene = get_tree().get_current_scene()#retorna a cena em que o player está, útil para instanciar cenas novas no mundo

#TIMERS
@onready var dash_time: Timer = $Timers/dash_time
@onready var dash_cd: Timer = $Timers/dash_cd

#SKILL LIST
const s_noskill = preload("res://Skills/s_noskill.gd")
const s_wall = preload("res://Skills/s_wall.gd")
const s_push = preload("res://Skills/s_push.gd")
const s_shoot = preload("res://Skills/s_shoot.gd")
#skill3
#skill4
#...

#UI ELEMENTS
#@onready var icon_skill_1: TextureRect = $"../UI/PlayerUI/GridContainer/icon skill 1"
@onready var icon_skill_1: TextureRect = $"UI/PlayerUI/GridContainer/icon skill 1"
@onready var icon_skill_2: TextureRect = $"UI/PlayerUI/GridContainer/icon skill 2"
#@onready var icon_skill_2: TextureRect = $"../UI/PlayerUI/GridContainer/icon skill 2"
#@onready var label_cargas_skill_1: Label = $"../UI/PlayerUI/GridContainer/label cargas skill 1"
@onready var label_cargas_skill_1: Label = $"UI/PlayerUI/GridContainer/label cargas skill 1"
@onready var label_cargas_skill_2: Label = $"UI/PlayerUI/GridContainer/label cargas skill 2"
#@onready var label_cargas_skill_2: Label = $"../UI/PlayerUI/GridContainer/label cargas skill 2"

var dash_speed = 60.0
var can_dash = true
var current_speed:float#current speed é usado para calcular o movimento do player, as vezes será setada como Speed, outras vezes como dash_speed

var equiped_skill1:Skill
var equiped_skill2:Skill

func _ready() -> void:
	#print(root_scene)
	#icon_skill_1 = get_parent().get_node()
	Health = Max_Health
	current_speed = Speed
	equiped_skill1 = s_noskill.new()#
	equiped_skill2 = s_noskill.new()#
	updateUI()

func _physics_process(delta: float) -> void:
	var d2d = get_input_direction2d()#como o jogador vai se mexer apenas em x e z, estou pegando a direcao de input em 2d
	var direction = Vector3(d2d.x, 0, d2d.y)
	
	if direction:
		velocity.x = direction.x * current_speed
		velocity.z = direction.z * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)#com esse delta (current_speed), o jogador para instantaneamente
		velocity.z = move_toward(velocity.z, 0, current_speed)#depois de soltar o input, um numero menor poderia fazer ele deslizar mais

	move_and_slide()

func _process(delta: float) -> void:
	get_dash_input()
	get_skill_input()

	#print(self.mesh.get_aabb().size)

##
#
func get_mouse_position()->Vector3:
	var viewport := get_viewport()
	var mouse_position := viewport.get_mouse_position()
	var camera := viewport.get_camera_3d()
	var origin := camera.project_ray_origin(mouse_position)
	var direction := camera.project_ray_normal(mouse_position)
	var ray_length := camera.far
	var end := origin + direction * ray_length
	var space_state := get_world_3d().direct_space_state
	var query := PhysicsRayQueryParameters3D.create(origin, end)
	var result := space_state.intersect_ray(query)
	var mouse_position_3D:Vector3 = result.get("position", end)
	return mouse_position_3D
#

func get_skill_input():
	if Input.is_action_just_pressed("skill1"):
		equiped_skill1.cast(global_position, get_mouse_position(), root_scene)
		if equiped_skill1.get_cargas()<=0:
			equiped_skill1 = s_noskill.new()
	if Input.is_action_just_pressed("skill2"):
		equiped_skill2.cast(global_position, get_mouse_position(), root_scene)
		if equiped_skill2.get_cargas()<=0:
			equiped_skill2 = s_noskill.new()
	updateUI()
#

func get_input_direction2d()->Vector2:
	var d = Vector2(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"), Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))
	d = d.normalized()
	d = d.rotated(PI/4)
	return d

func get_dash_input():
	if Input.is_action_just_pressed("ui_accept") and can_dash:
		dash()

func dash():
	current_speed = dash_speed
	dash_time.start()

#TIMERS
#
func _on_dash_time_timeout() -> void:
	current_speed = Speed
	can_dash = false
	dash_cd.start()

func _on_dash_cd_timeout() -> void:
	can_dash = true
	print("can dash")
#


#
#####HANDLE UI
#
func updateUI():
	updateIcons()
	updateLabels()

func updateLabels():
	var c1 = equiped_skill1.get_cargas()
	var c2 = equiped_skill2.get_cargas()
	if equiped_skill1.get_name() == ("no_skill"): c1 =0
	if equiped_skill2.get_name() == ("no_skill"): c2 =0
	label_cargas_skill_1.text = str(c1)
	label_cargas_skill_2.text = str(c2)

func updateIcons():
	icon_skill_1.texture = equiped_skill1.ICON
	icon_skill_2.texture = equiped_skill2.ICON
#

func test():
	print("teste")
