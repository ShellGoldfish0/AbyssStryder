extends Node

#FOR SAVING
signal save_detected
signal save_not_found
#END SAVING SIGNALS

#START READY FUNCTION - INITIATES THE GAME WITH OR WITHOUT SAVES
func _ready():
	#Save.load()
	if Save.player.Room_Number != null:
		print("Save was found!")
		emit_signal("save_detected")
	else:
		print("Save was not found!")
		emit_signal("save_not_found")
#END READY FUNCTION
	
		


