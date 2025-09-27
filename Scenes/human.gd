extends Area2D

signal collected

var player_in_range = false

func _on_Area2D_body_entered(body):
	if (body is Player): # Assuming your player is in a "player" group
		player_in_range = true

func _on_Area2D_body_exited(body):
	if (body is Player):
		player_in_range = false

func _process(delta):
	if player_in_range and Input.is_action_just_pressed("sacrifice"): # "collect" is your input action
		emit_signal("collected")
		queue_free() # Remove the collectible after collection
