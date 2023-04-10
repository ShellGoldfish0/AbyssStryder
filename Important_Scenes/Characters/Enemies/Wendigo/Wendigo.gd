extends Enemy


onready var ranged_timer = $Timer
var slow_aoe = load("res://Important_Scenes/Characters/Enemies/Debuffs/Speed_Debuff.tscn")
var damage_aoe = load("res://Important_Scenes/Characters/Enemies/Debuffs/AOE_Damage.tscn")
onready var pd = $PlayerDetector
var rng = RandomNumberGenerator.new()
var states = ["RA", "MA","CA","I", "C"]
var state
var container
var prev_speed = 150

func _ready():
	state = "I"
	navigation_agent = $NavigationAgent2D
	spawn_position = position
	target = spawn_position
	

func _physics_process(delta):
	if position == spawn_position:
		velocity = Vector2.ZERO
	target_location = target
	mov_direction = position.direction_to(target)
	velocity = mov_direction * max_speed
	navigation_agent.set_velocity(velocity)
	
	for body in $PlayerDetector.get_overlapping_bodies():   # Check to see that overlap is Player layer
		target = body.position
	if $PlayerDetector.overlaps_body(player) == false:
			target = spawn_position
	if state == "I":
		pass
	elif state == "RA":
		max_speed = 0
		ranged_timer.start()
		if container == null:
			$Position2D.global_position = player.global_position
			container = "full"
		state = "I"
		
	elif state == "MA":
		
		$Hitbox.monitorable = true
		$Hitbox.monitoring = true
		
		
	
	





func _on_Timer_timeout():
	var attack_selector = rng.randi_range(0, 1)
	if attack_selector == 0:
		var sl_attack = slow_aoe.instance()
		
		sl_attack.global_position = $Position2D.global_position
		print(sl_attack.position)
		get_parent().add_child(sl_attack)
		max_speed = prev_speed
		container = null
	else:
		var sl_attack = damage_aoe.instance()
		sl_attack.global_position = $Position2D.global_position
		get_parent().add_child(sl_attack)
		max_speed = prev_speed
		container = null
	state = "MA"


func _on_PlayerDetector_body_entered(body):
	state = "RA"
	player = body
	target = player.position



