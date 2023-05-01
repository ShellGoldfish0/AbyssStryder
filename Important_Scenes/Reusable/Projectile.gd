extends Area2D

const RIGHT = Vector2.RIGHT

export(int) var SPEED = 150
#ITS A BULLET - GETS MOVEMENT
func _physics_process(delta):
	var movement = RIGHT.rotated(rotation) * SPEED * delta
	global_position += movement
#END

#BULLET IS DESTROYED
func destroy():
	queue_free()
#IT DOES END

func _on_VisibilityNotifier2D_screen_entered():
	pass

#IF IT GOES OFF SCREEN, ITS DELETED
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
#END



#CHECKS FOR HURBOXES
func _on_Hitbox_area_entered(area):
	area.owner.take_damage($Hitbox.damage)
	queue_free()
#END

#IF THE PROJECTILE HITS A WALL, DESTROYS
func _on_Projectile_body_entered(body):
	if body is TileMap:
		queue_free()
#END
