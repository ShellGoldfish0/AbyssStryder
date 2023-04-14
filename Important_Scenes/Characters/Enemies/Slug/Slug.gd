extends Enemy

onready var animation = $AnimationPlayer
onready var enemy_stats = $EnemyStats

func _ready():
	animation_player.play("test")
func _physics_process(_delta):
	if position == spawn_position:
		velocity = Vector2.ZERO
	navigation_agent.set_target_location(target_location)
	mov_direction = position.direction_to(target_location)
	if mov_direction.x > 0:
		animated_sprite.flip_h = true
	elif mov_direction.x < 0:
		animated_sprite.flip_h = false
		
	velocity = mov_direction * max_speed
	navigation_agent.set_velocity(velocity)
	for body in $PlayerDetect.get_overlapping_bodies():   # Check to see that overlap is Player layer
		target_location = body.position
	if $PlayerDetect.overlaps_body(player) == false:
			target_location = spawn_position
	 
	

func take_damage(dam: int) ->int:
	$EnemyStats.health -= dam
	if $EnemyStats.health <= 0:
		if .has_method("on_death") == true:
			on_death()
		var temp = get_parent()
		temp._on_enemy_killed()
	return stats.health

func on_death():
	max_speed = 0
	animation_player.play("death")
	$Light2D.enabled = true

	


func _on_AnimationPlayer_animation_finished(anim):
	if anim == "death":
		queue_free()
	else:
		return
		





	


func _on_EnemyStats_no_health():
	on_death()


func _on_PlayerDetect_area_entered(area):
	pass
	


func _on_PlayerDetect_body_entered(body):
	player = body
	set_target_location(player.position)
	
