extends Control

signal no_more_lives

var score: int = 0

func update_fuel():
	$update_tween.interpolate_property($h_box_container/fuel_bar, "value", $h_box_container/fuel_bar.value, g.lives, 0.4, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$update_tween.start()

func _on_player_update_health() -> void:
	update_fuel()

func _on_score_timer_timeout() -> void:
	if g.can_increase_score:
		score += 1
		$h_box_container/score_label.text = str(score)

func _on_decrease_lives_timer_timeout() -> void:
	g.lives -= 5
	update_fuel()
	emit_signal("no_more_lives")
