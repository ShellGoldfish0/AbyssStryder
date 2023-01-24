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
	Stats.set_max_health(Stats.max_health + 4)
	Stats.set_health(Stats.max_health)
	print(Stats.max_health)
	queue_free()
	
