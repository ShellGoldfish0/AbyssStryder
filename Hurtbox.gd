extends Area2D


var kb_d 
var kb_f = 3
var player = get_parent()

func _init() -> void:
	collision_layer = 0
	collision_mask = 8


func _ready() -> void:
	connect("area_entered", self, "_on_area_entered")


func _on_area_entered(hitbox: Hitbox) -> void:
	if Hitbox == null:
		return
	if owner.has_method("take_damage"):
		
		print(kb_f)
		var damage = hitbox.damage
		owner.take_damage(damage)
		
