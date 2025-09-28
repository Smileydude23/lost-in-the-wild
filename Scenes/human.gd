extends Node

signal collected

@onready var i_will_kill_myself = true

@onready var player_in_range = false
@export var value: int = 1

func _on_body_entered(body):
	#if body.is_in_group("player"):
	#	player_in_range = true
	#	print(body.name)
	print("Something entered:", body.name)
	if body.name == "Player":
		print("It's the player!")
		player_in_range = true
		
func _on_body_exited(body):
	if body.name == "Player":
		player_in_range = false
		print(body.name)
		
func _process(_delta):
	if Input.is_action_just_pressed("sacrifice") and player_in_range:
		emit_signal("collected")
		queue_free() # Remove the object
		print(player_in_range)

func _on_2d_body_entered(body):
	if body.is_in_group("player"):
		GameController.coin_collected(value)
		queue_free()
