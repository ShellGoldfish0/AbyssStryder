extends Area2D


onready var collision_shape: CollisionShape2D = get_node("CollisionShape2D")



func _on_Descender_body_entered(body):
	#collision_shape.set_deferred("disabled", true)
	var roomgen = get_parent().get_parent()
	roomgen.delete()
	roomgen._spawn_rooms()
	Save.save(Save.player)
	
	
