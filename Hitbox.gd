extends Area2D
class_name Hitbox

export(int) var damage: int = 10
var knockback_direction: Vector2 = Vector2.ZERO
var knockback_force: int = 300

onready var collision_shape: CollisionShape2D = get_child(0)


func _init() -> void:
	collision_layer = 8
	collision_mask = 0
	#collision_shape.disabled = true


#func _deal_damage():
	#collision_shape.disabled = false
	#collision_shape.disabled = true

#unc _on_body_entered(body: KinematicBody2D) -> void:
#	if body == null:
#		return
#	body.take_damage(damage, knockback_direction, knockback_force)
