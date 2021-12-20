extends RigidBody2D

var skins: Array = []

func _ready() -> void:
	randomize()
	change_skin()

func change_skin():
	for texture in range(20):
		skins.append(load("res://assets/enemy/enemy_" + str(texture + 1) + ".png"))
	var random_skin = randi() % skins.size()
	$skin.texture = skins[random_skin]

