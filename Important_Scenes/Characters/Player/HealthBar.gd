extends Control
#DECLARES ITSELF
onready var healthbar = $HealthBar
#END DECLARES

#START ONHEALTHUPDATED - ALLOWS THE HEALTHBAR TO BE UPDATED TO THE SPECIFIED VALUE 
func _on_health_updated(health):
	healthbar.value = health
#END ONHEALTHUPDATED

#START ONMAXHEALTHUPDATED - UPDATES HEALTHBAR MAX VALUE
func _on_max_health_updated(max_health):
	healthbar.max_value = max_health
#END ONMAXHEALTHUPDATED
	
#START READY - INITIALIZES HEALTHBAR.
func _ready():
	_on_max_health_updated(Save.player.Max_Health)
#END READY
