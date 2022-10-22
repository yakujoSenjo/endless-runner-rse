extends Node2D



func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_parent().spawn_tile(448)
		get_parent().spawn_tile(448)
		$Timer.start()


func _on_Timer_timeout():
	queue_free()
