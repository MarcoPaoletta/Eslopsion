extends KinematicBody2D

var speed: int = 400

var started: bool = false
var alive: bool = true

var target: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO


func new_game():
	position = get_viewport().size / 2
	g.can_increase_score = true
	g.can_modify_lives = true
	g.lives = 100

func _ready() -> void:
	new_game()
	
func look_at_mouse() -> void:
	for nodes in get_tree().get_nodes_in_group("to_rotate"):
		nodes.look_at(get_global_mouse_position())
		nodes.rotation_degrees += 90

func _process(_delta: float) -> void:
	if alive:
		look_at_mouse()
	
func _physics_process(_delta: float) -> void:
	if started and alive:
		velocity = position.direction_to(target) * speed
		if position.distance_to(target) > 5:
			velocity = move_and_slide(velocity)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		$move.play()
		target = get_global_mouse_position()
		started = true

func update_health():
	get_parent().get_node("hud").update_fuel()

func delete_objects():
	for objects in get_tree().get_nodes_in_group("object"):
		objects.queue_free()

func exploid():
	$game_over.play()
	$explosion.show()
	$explosion/animation_player.play("explosion")
	yield($explosion/animation_player, "animation_finished")
	$explosion.queue_free()
	yield(get_tree().create_timer(1.5), "timeout")
	get_tree().change_scene("res://rsc/scenes/lobby.tscn")

func lower_sound() -> void:
	$move.volume_db = -80
	get_parent().get_node("music").volume_db = -80

func game_over() -> void:
	if g.lives <= 0:
		alive = false
		collision_mask = 16
		g.can_spawn = false
		g.can_increase_score = false
		g.can_modify_lives = false
		delete_objects()
		exploid()
		lower_sound()

func hit():
	$hit.play()
	var decrease_lives: int = randi() % 11 + 11 
	g.lives -= decrease_lives
	update_health()
	game_over()
		
func recharge_fuel():
	$fuel.play()
	g.lives += 10
	update_health()
		
func _on_hit_box_body_entered(body: Node) -> void:
	if body.is_in_group("enemy"):
		hit()
		body.queue_free()

func _on_hit_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("fuel"):
		recharge_fuel()
		area.queue_free()

func _on_hud_no_more_lives() -> void:
	game_over()
