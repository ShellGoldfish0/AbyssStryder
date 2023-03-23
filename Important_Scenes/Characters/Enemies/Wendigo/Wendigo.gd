extends Enemy


onready var ranged_timer = $Timer
var slow_aoe = load("res://Important_Scenes/Characters/Enemies/Debuffs/Speed_Debuff.tscn")
var damage_aoe = load("res://Important_Scenes/Characters/Enemies/Debuffs/AOE_Damage.tscn")
onready var pd = $PlayerDetector
var rng = RandomNumberGenerator.new()
var states = ["RA", "MA","CA","I", "C"]
var state
var container
var prev_speed = max_speed

func _ready():
	state = "I"
	navigation_agent.set_target_location(spawn_position)
	print(target_location)

func _physics_process(delta):
	if position == spawn_position:
		velocity = Vector2.ZERO
	mov_direction = position.direction_to(target_location)
	velocity = mov_direction * max_speed
	navigation_agent.set_velocity(velocity)
	if state == "I":
		pass
	elif state == "RA":
		ranged_timer.start()
		if container == null:
			$Position2D.global_position = player.global_position
			container = "full"
		state = "I"
		
	elif state == "MA":
		
		$Hitbox.monitorable = true
		$Hitbox.monitoring = true
		if not _arrived_at_location():
			velocity = move_and_slide(velocity)
		
	
	
	





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
	target_location = player
