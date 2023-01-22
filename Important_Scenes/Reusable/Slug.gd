extends Enemy

onready var animation_player = $AnimationPlayer


func _ready():
	target = player.position
	animation_player.play("test")
	
func _physics_process(_delta):
	
	on_death()
	
	
	
	
func on_death():
	if health <= 0:
		max_speed = 0
		animation_player.play("death")
		$Light2D.enabled = true
		
		
	else:
		return
	


func _on_AnimationPlayer_animation_finished(anim):
	if anim == "death":
		queue_free()
	else:
		return
