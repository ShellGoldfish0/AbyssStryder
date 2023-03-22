extends Enemy


onready var ranged_timer = $Timer
var slow_aoe = load("res://Important_Scenes/Characters/Enemies/Debuffs/Speed_Debuff.tscn")
onready var pd = $PlayerDetector
var rng = RandomNumberGenerator.new()
var states = ["RA", "MA","CA","I", "C"]
var state
var container
var prev_speed = max_speed

func _ready():
	state = "I"

func _physics_process(delta):
	if state == "I":
		pass
	elif state == "RA":
		ranged_timer.start()
		if container == null:
			container = player.position
			
		state = "I"
		
		





func _on_Timer_timeout():
	var attack_selector = 0 #rng.randi_range(0, 1)
	if attack_selector == 0:
		var sl_attack = slow_aoe.instance()
		
		sl_attack.global_position = player.global_position
		print(sl_attack.position)
		get_parent().add_child(sl_attack)
		max_speed = prev_speed
		
		
	


func _on_PlayerDetector_body_entered(body):
	state = "RA"
	player = body
