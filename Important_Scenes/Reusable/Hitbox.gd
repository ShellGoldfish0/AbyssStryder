extends Area2D
class_name Hitbox
#THE DAMAGE
export(int) var damage: int = 4


onready var collision_shape: CollisionShape2D = get_child(0)



