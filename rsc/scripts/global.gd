extends Node

var max_lives: int = 100
var lives: int = 100

var can_spawn: bool = true
var can_increase_score: bool = true
var can_modify_lives: bool = true

func _ready() -> void:
	center_window()
	
func center_window():
	OS.center_window()
	
func _process(delta: float) -> void:
	check_lives()

func check_lives():
	if lives == max_lives:
		can_modify_lives = false
	if lives != max_lives:
		can_modify_lives = true
 
