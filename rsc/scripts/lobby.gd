extends Control

var press: bool = false

func _on_play_button_pressed() -> void:
	$play_button.disabled = true
	yield($play, "finished")
	get_tree().change_scene("res://rsc/scenes/main.tscn")

func _on_play_button_button_down():
	$play.play()
