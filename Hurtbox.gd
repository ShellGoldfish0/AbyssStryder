extends Area2D
class_name Hurtbox

var kb_d 
var kb_f = 3
var dam = 10

func _init() -> void:
	collision_layer = 0
	collision_mask = 8


func _ready() -> void:
	connect("area_entered", self, "_on_area_entered")


func _on_area_entered(hitbox: Hitbox) -> void:
	if Hitbox == null:
		return
	if owner.has_method("take_damage"):
		print("killed")
		print(kb_f)
		#kb_d = get_global_mouse_position() - global_position.normalized()
		owner.take_damage(dam)
		print(owner.health)
