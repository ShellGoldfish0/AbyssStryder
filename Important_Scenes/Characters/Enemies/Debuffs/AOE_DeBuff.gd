extends Area2D
class_name AOE_Debuff


var previous_stat_value

var debuff_list = ["max_speed"]
var debuff
var value

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_AOE_Debuff_body_entered(body):
	if debuff == "max_speed":
		previous_stat_value = body.get(debuff)
		body.max_speed = value
	




func _on_AOE_Debuff_body_exited(body):
	if debuff == "max_speed":
		body.max_speed = previous_stat_value
	
	

	
