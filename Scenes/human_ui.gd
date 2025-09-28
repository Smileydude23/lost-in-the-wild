extends Control

@onready var label = $Label

func _ready():
	Human.connect("collected", on_event_collected)
	
	
func on_event_collected(value: int):
	label.text = str(value)
