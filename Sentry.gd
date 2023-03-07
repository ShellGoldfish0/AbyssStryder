extends KinematicBody2D

onready var player = get_parent().get_node("Lilith")
var BULLET = load("res://Important_Scenes/Reusable/Projectile.tscn")
var target = null
var burst = 0
onready var raycast = $RayCast2D
onready var reset_timer = $RayCast2D/Reset_Timer


func shoot():
	if $BurstTimer.is_stopped():
		burst += 1
		var bullet = BULLET.instance()
		add_child(bullet)
		bullet.global_position = global_position
		bullet.global_rotation = raycast.global_rotation
		reset_timer.start()
		if burst >= 3:
			$BurstTimer.start()
			burst = 0
	
	
	
	
func _ready():
	yield(get_tree(), "idle_frame")
	
	
func _physics_process(delta):
	if target != null and target == player:
		var angle_to_target: float = global_position.direction_to(target.global_position).angle()
		raycast.global_rotation = angle_to_target
		
		if $Player_Detection.get_overlapping_bodies() != null:
			for entity in $Player_Detection.get_overlapping_bodies():
				if entity != player:
					return
				else:
					if reset_timer.is_stopped() and entity == player:
						shoot()
			
				
				

func take_damage(dam: int) ->int:
	$enemy_stats.health -= dam
	if $enemy_stats.health <= 0:
		var temp = get_parent()
		temp._on_enemy_killed()
		queue_free()
	return $enemy_stats.health

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_enemy_stats_no_health():
	queue_free()


func _on_Reset_Timer_timeout():
	raycast.enabled = true


func _on_Player_Detection_body_entered(body: KinematicBody2D):
	target = body


func _on_Player_Detection_body_exited(body):
	target = null





func _on_Hurtbox_area_entered(area):
	take_damage(area.damage)
