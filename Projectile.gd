extends Area2D

const RIGHT = Vector2.RIGHT

export(int) var SPEED = 150

func _physics_process(delta):
	var movement = RIGHT.rotated(rotation) * SPEED * delta
	global_position += movement


func destroy():
	queue_free()
	

func _on_VisibilityNotifier2D_screen_entered():
	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()





func _on_Hitbox_area_entered(area):
	area.owner.take_damage($Hitbox.damage)
	queue_free()


func _on_Projectile_body_entered(body):
	if body is TileMap:
		queue_free()
