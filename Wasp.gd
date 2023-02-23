extends Enemy

onready var enemy_stats = $EnemyStats
onready var nav_agent = $NavigationAgent2D
onready var anim_player = $AnimationPlayer
onready var anim_sprite = $AnimatedSprite


var new_location = null
var current_location = null
var state = "wander"





func _ready():
	max_speed = 100
	acceleration = 50
	
	
	


func _physics_process(delta) -> void:
	if not _arrived_at_location():
		velocity = move_and_slide(velocity)
	for body in $PlayerDetect.get_overlapping_bodies():   # Check to see that overlap is Player layer
		target_location = body.position
		navigation_agent.set_target_location(target_location)
		if $PlayerDetect.overlaps_body(player) == false:
			state = "wander"
		else:
			state = "attack"
			
	if state == "wander":
		$WanderTimer.start()
		
	elif state == "attack":
		navigation_agent.set_target_location(target_location)
		mov_direction = position.direction_to(target_location)
		velocity = mov_direction * max_speed
		navigation_agent.set_velocity(velocity)
		if $PlayerDetect.overlaps_body(player) == false:
			state = "wander"
		
	else:
		print("fuck")
		


func wander():
	if velocity != Vector2.ZERO:
		#print(position)
		target_location = Vector2(rand_range(position.x -300 , position.x +300  ), rand_range(position.y- 300 , position.y +300  ) )
		var target_location2 = Vector2(rand_range(position.x -300 , position.x +300  ), rand_range(position.y- 300 , position.y +300  ) )
		var target_location3 = Vector2(rand_range(position.x -300 , position.x +300  ), rand_range(position.y- 300 , position.y +300  ) )
		navigation_agent.set_target_location(target_location)
		mov_direction = position.direction_to(target_location)
		velocity = mov_direction * 50
		navigation_agent.set_velocity(velocity)
		#$WanderTimer.start()
		move_and_slide(velocity)
	




func _on_WanderTimer_timeout():
	wander()
