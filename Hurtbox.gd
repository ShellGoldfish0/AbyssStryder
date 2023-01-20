extends Area2D
<<<<<<< HEAD

var invincible = false setget set_invincible
=======


var kb_d 
var kb_f = 3
var player = get_parent()
>>>>>>> 6a52e20f9fb192cccfb72e425e3ed397d10dd342

onready var timer = $Timer
onready var collisionShape = $CollisionShape2D
=======
class_name Hurtbox

var kb_d 
var kb_f = 3
var dam = 10
>>>>>>> parent of 8acb496 (Minor patch)

signal invincibility_started
signal invincibility_ended

func set_invincible(value):
	invincible = value
	if invincible == true:
		emit_signal("invincibility_started")
	else:
		emit_signal("invincibility_ended")

func start_invincibility(duration):
	self.invincible = true
	timer.start(duration)

<<<<<<< HEAD
func _on_Timer_timeout():
	self.invincible = false

<<<<<<< HEAD
func _on_Hurtbox_invincibility_started():
	collisionShape.set_deferred("disabled", true)

func _on_Hurtbox_invincibility_ended():
	collisionShape.disabled = false
=======
func _on_area_entered(hitbox: Hitbox) -> void:
	if Hitbox == null:
		return
	if owner.has_method("take_damage"):
		print("killed")
		print(kb_f)
<<<<<<< HEAD
		var damage = hitbox.damage
		owner.take_damage(damage)
		print(owner.hp)
>>>>>>> 6a52e20f9fb192cccfb72e425e3ed397d10dd342
=======
		#kb_d = get_global_mouse_position() - global_position.normalized()
		owner.take_damage(dam)
		print(owner.health)
>>>>>>> parent of 8acb496 (Minor patch)
>>>>>>> 2de88175e5ac41e0c52ca5d4fea6da0108ddd0df
