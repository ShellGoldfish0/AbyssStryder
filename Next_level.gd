extends Area2D


onready var collision_shape: CollisionShape2D = get_node("CollisionShape2D")



func _on_Descender_body_entered(body):
	collision_shape.set_deferred("disabled", true)
	SceneTransistor.start_transition_to("res://Important_Scenes/Levels/Level_2.tscn")
	print("wtf dude")
	
