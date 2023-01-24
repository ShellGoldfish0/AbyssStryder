extends Enemy

onready var animation = $AnimationPlayer
onready var enemy_stats = $EnemyStats

func _ready():
	animation_player.play("test")
func _physics_process(_delta):
	
	for body in $PlayerDetect.get_overlapping_bodies():   # Check to see that overlap is Player layer
		target_location = body.position
	if $PlayerDetect.overlaps_body(player) == false:
			target_location = spawn_position
	 
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
	set_target_location(player.position)


func _on_PlayerDetect_body_entered(body):
	pass
	
