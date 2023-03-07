extends Enemy

onready var enemy_stats = $EnemyStats
onready var nav_agent = $NavigationAgent2D
onready var anim_player = $AnimationPlayer
onready var anim_sprite = $AnimatedSprite
var BULLET = load("res://Important_Scenes/Characters/Enemies/Wasp/Stinger.tscn")

var new_location = null
var current_location = null
var state = "wander"
var wander = OpenSimplexNoise.new()
var time = 0


#set accelartion
func _ready():
	max_speed = 100
	acceleration = 50
	wander.seed = rand_range(0, 10000)
	wander.period = 300
	
	
	


func _physics_process(delta: float) -> void:
	if target != null and target == player:
		var angle_to_target: float = global_position.direction_to(target.global_position).angle()
		$RayCast2D.global_rotation = angle_to_target
	if not _arrived_at_location():
		velocity = move_and_slide(velocity)
	for body in $PlayerDetect.get_overlapping_bodies():   # Check to see that overlap is Player layer
		target_location = body.position                    #THEN IDENTIFIES AND SETS THE TARGET AS AN ENEMY
		navigation_agent.set_target_location(target_location)
		if $PlayerDetect.overlaps_body(player) == false:
			state = "wander"
		else:
			state = "attack"
			
	if state == "wander":
		time += 5
		var rotation = wander.get_noise_1d(time) * delta * 360			#GRABS THE INTERNAL ROTATION AND THEN APPLYS THAT TO MOVE THEM IN THE DIRECTION
		move_and_slide(Vector2(cos(rotation), sin(rotation)) * 100)
		
	elif state == "attack":
		navigation_agent.set_target_location(target_location)
		mov_direction = position.direction_to(target_location)
		velocity = mov_direction * max_speed						#JUST CHASES YOU
		navigation_agent.set_velocity(velocity)
		if $Attack_Timer.is_stopped():
			var bullet = BULLET.instance()
			get_parent().add_child(bullet)
			print("feck")
			bullet.global_position = global_position
			bullet.global_rotation = $RayCast2D.global_rotation
			$Attack_Timer.start()
		
		if $PlayerDetect.overlaps_body(player) == false:
			state = "wander"
		
		










func _on_PlayerDetect_body_entered(body):
	target = body


func _on_PlayerDetect_body_exited(body):
	target = null


func _on_Hurtbox_area_entered(area):
	take_damage(area.damage)
