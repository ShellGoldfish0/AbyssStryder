extends Node2D
class_name Item


#VARIABLE NAMES
export var buff = "max_speed"

export var value = 0
#END VARIABLES

#CHECKS FOR INTERACTION
func _on_interact():
	#print("COnnection detected")
	_apply_buff()
#END

#GRABS BUFF AND THEN RUNS THE NECASSARY CODE.
func _apply_buff():
	if buff == "Max_speed":
		get_tree().call_group("Player", "update_speed", value)
	elif buff == "damage":
		Save.player.Damage += value
		get_tree().call_group("Player", "update_damage")
		Save.save()
		print(Save.player.Damage)
	
	
	queue_free()
		
		

