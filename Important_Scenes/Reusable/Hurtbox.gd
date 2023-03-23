extends Area2D
class_name Hurtbox

var invincible = false setget set_invincible

onready var timer = get_node("Timer")
onready var collisionShape = $CollisionShape2D

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


func _on_Timer_timeout():
	pass # Replace with function body.



#Hurtbox invis functions -- will be used to communicate with AnimationPlayer
func _on_Hurtbox_invincibility_started():
	pass # Replace with function body.


func _on_Hurtbox_invincibility_ended():
	pass # Replace with function body.


func _on_Hurtbox_area_entered(hitbox: Area2D) -> void:
	owner.take_damage(hitbox.damage)
	start_invincibility(0.6)
	
	
	
	
	#Hurbox.create_hit_effect()
