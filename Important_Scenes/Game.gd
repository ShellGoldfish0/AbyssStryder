extends Node

signal save_detected
signal save_not_found
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Save.load()
	if Save.player.Room != null:
		print("Save was found!")
		emit_signal("save_detected")
	else:
		print("Save was not found!")
		emit_signal("save_not_found")

	
		
