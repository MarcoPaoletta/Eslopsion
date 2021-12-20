extends Area2D

var skins: Array = [
	load("res://assets/fuel/fuel_1.png"),
	load("res://assets/fuel/fuel_2.png"),
	load("res://assets/fuel/fuel_3.png"),
	load("res://assets/fuel/fuel_4.png"),
]

func _ready() -> void:
	randomize()
	change_skin()

func change_skin():
	var random_skin = randi() % skins.size()
	$skin.texture = skins[random_skin]
	
func _on_delete_timer_timeout() -> void:
	queue_free()
