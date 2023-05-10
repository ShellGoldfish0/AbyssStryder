extends Enemy

onready var animation = $AnimationPlayer
onready var enemy_stats = $EnemyStats


func _ready():
	animation_player.play("test")
	if get_tree().has_group("nav"):
		nav = get_tree().get_nodes_in_group("nav")[0]
	path = []
		
func _physics_process(_delta):
	create_path()
	goto()
	


func create_path():
	if nav != null and player != null:
		path = nav.get_simple_path(global_position, player.global_position, false)
		
func goto():
	if path.size() > 0 and path != null:
		velocity = global_position.direction_to(path[1]) * max_speed
	

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
	pass


	


func _on_PlayerDetect_body_entered(body):
	if get_tree().has_group("Player"):
		player = get_tree().get_nodes_in_group("Player")[0]
	




func _on_Hitbox_area_entered(area):
	take_damage(9999)
