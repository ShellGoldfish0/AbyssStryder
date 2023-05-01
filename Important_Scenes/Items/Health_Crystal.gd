extends Area2D




#HEALS THE PLAYER, THEN DELETES ITSELF.
func _on_Health_Crystal_body_entered(player: KinematicBody2D) -> void:
	if player == null:
		return
	Save.player.Max_Health = Save.player.Max_Health + 4
	Save.player.Health = Save.player.Health + 10
	if Save.player.Health > Save.player.Max_Health:
		Save.player.Health = Save.player.Max_Health
	
	var temp_update = player.get_node("HealthBar")
	temp_update._on_max_health_updated(Save.player.Max_Health)
	temp_update._on_health_updated(Save.player.Health)
	
	queue_free()
	
