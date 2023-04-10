extends Control
onready var healthbar = $HealthBar

func _on_health_updated(health):
	healthbar.value = health


func _on_max_health_updated(max_health):
	healthbar.max_value = max_health
	
	
func _ready():
	_on_max_health_updated(Stats.max_health)
	
