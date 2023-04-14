extends Area2D
class_name AOE_Debuff


var previous_stat_value

var debuff_list = ["max_speed", "max_health"]
var debuff
var value



func _on_AOE_Debuff_body_entered(body):
	if debuff == "max_speed":
		previous_stat_value = body.get(debuff)
		body.max_speed = value
		
	




func _on_AOE_Debuff_body_exited(body):
	if debuff == "max_speed":
		body.max_speed = previous_stat_value
	if debuff == "max_health":
		Save.player.Health = Save.player.Health - value
		var temp_update = body.get_node("HealthBar")
		temp_update._on_max_health_updated(Save.player.Max_Health)
		temp_update._on_health_updated(Save.player.Health)
	

	
