extends Actor

enum state{
	WANDER,
	CHASE,
	ATTACK,
	SHOOTING
}

const BULLET = preload("res://Skills/bullet.tscn")

@onready var timer_aux: Timer = $timer_aux

var current_state:state = state.WANDER

const DASH_SPEED = 10.0
const ATRITO = 0.3

var player_pos:Vector3 = Vector3.ZERO

func _ready() -> void:
	Health = Max_Health

func _physics_process(delta: float) -> void:
	velocity = velocity.move_toward(Vector3.ZERO, ATRITO)
	move_and_slide()

func _process(delta: float) -> void:
	
	match current_state:
		state.WANDER:
			pass
		state.CHASE:
			pass
		state.ATTACK:
			pass


func change_state():
	update_player_position()
	if !(get_parent().has_node("Player")):
		return
	var show = get_parent().get_node("Player/UI")
	var d = global_position.distance_to(player_pos)
	var prev_state = current_state
	if d<10 and show.current_state == 1:
		current_state = state.ATTACK
	elif d<25 and show.current_state == 1:
		current_state = state.CHASE
		if(prev_state != current_state):
			if bool(randi() % 2):
				current_state = state.SHOOTING
				shoot()
	else:
		current_state = state.WANDER
	
func get_direction_to_player() -> Vector3:
	update_player_position()
	return (player_pos - global_position).normalized()

func update_player_position():
	if (get_parent().has_node("Player")):
		player_pos = (get_parent().get_node("Player").global_position)

func dash_towards_player():
	var d = get_direction_to_player()
	velocity = d * DASH_SPEED
	look_at(player_pos)
	
	#global_rotation = Vector3(0, Vector2(d.x,d.z).angle() , 0)

func investida():
	velocity = Vector3.ZERO
	var d = get_direction_to_player()
	velocity = d * 2*DASH_SPEED
	#global_rotation = Vector3(0, Vector2(d.x,d.z).angle() , 0)
	look_at(player_pos)
	

func shoot():
	#print("pew pew")
	
	update_player_position()
	var dir = get_direction_to_player()
	var b = BULLET.instantiate()
	get_parent().add_child(b)
	b.global_position = global_position + 2*dir
	print(dir)
	b.set_linear_velocity(dir*30)

func _on_timer_check_player_timeout() -> void:
	change_state()
	#dash_towards_player()

func _on_timer_aux_timeout() -> void:
	#print(current_state)
	match current_state:
		state.WANDER:
			pass
		state.CHASE:
			investida()
		state.ATTACK:
			dash_towards_player()
