extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


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
	
