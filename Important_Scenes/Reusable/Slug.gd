extends Enemy

onready var animation = $AnimationPlayer
onready var enemy_stats = $EnemyStats

func _ready():
	target = player.position
	animation_player.play("test")
func _physics_process(_delta):
	
	pass
	
	
	
	
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
