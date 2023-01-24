extends Area2D
class_name Hitbox

export(int) var damage: int 


onready var collision_shape: CollisionShape2D = get_child(0)


func _init() -> void:
	collision_layer = 8
	collision_mask = 0

