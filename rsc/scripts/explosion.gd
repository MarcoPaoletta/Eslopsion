extends Sprite

func exploid():
	show()
	$animation_player.play("explosion")
	yield($animation_player, "animation_finished")
	queue_free()
	yield(get_tree().create_timer(2), "timeout")
	get_tree().quit()
