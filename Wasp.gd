extends KinematicBody2D 

onready var player = get_node("/root/HAHA/Player")
onready var agent: NavigationAgent2D = $NavigationAgent2D
var velocity = Vector2.ZERO
var spawn = Vector2(-701, -14)
var target = null
onready var timer: Timer = $Timer

func _ready():
	timer.connect("timeout", self, "_update_pathfinding")

func _physics_process(_delta):
	if agent.is_navigation_finished():
		return
	if target:
		velocity = global_position.direction_to(agent.get_next_location()) * 2
		velocity = move_and_collide(velocity)
		_update_pathfinding()
	else: 
		agent.set_target_location(spawn)
		velocity = global_position.direction_to(agent.get_next_location()) * 2
		velocity = move_and_collide(velocity)

func _update_pathfinding():
	agent.set_target_location(player.global_position)

func _on_WaspArea_body_entered(body):
	if body == player:
		agent.set_target_location(player.global_position)
		target = body

func _on_WaspArea_body_exited(_body):
	target = null
