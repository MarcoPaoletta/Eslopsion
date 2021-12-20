extends Node

export (PackedScene) var enemy
export (PackedScene) var fuel

func _ready() -> void:
	randomize()

func change_wait_time(num_1, num_2, node):
	var random_wait_time: float = rand_range(num_1, num_2)
	node.wait_time = random_wait_time

func spawn_enemy():
	change_wait_time(0.1, 0.5, $spawn_enemy_timer)
	$enemy_path/path_follow_2d.set_offset(randi())
	var enemy_instance: Node = enemy.instance()
	get_parent().add_child(enemy_instance)
	var direction: int = $enemy_path/path_follow_2d.rotation + PI / 2
	enemy_instance.position = $enemy_path/path_follow_2d.position
	direction += rand_range(-PI / 4, PI / 4)
	enemy_instance.rotation = direction
	enemy_instance.set_linear_velocity(Vector2(rand_range(150, 250), 0).rotated(direction))

func _on_spawn_enemy_timer_timeout() -> void:
	if g.can_spawn:
		spawn_enemy()

func spawn_fuel():
	change_wait_time(3, 5, $spawn_fuel_timer)
	var fuel_instance: Node = fuel.instance()
	get_parent().add_child(fuel_instance)
	var width = get_viewport().size.x
	var height = get_viewport().size.y
	var random_width = rand_range(30, width - 30)
	var random_height = rand_range(30, height - 30)
	fuel_instance.position = Vector2(random_width, random_height)

func _on_spawn_fuel_timer_timeout() -> void:
	if g.can_spawn:
		spawn_fuel()

	
