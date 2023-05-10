extends KinematicBody2D

export(float) var MAX_SPEED = 105


var velocity = Vector2.ZERO
var path = []
var nav = null
var player = null
var target_location = Vector2.ZERO
var last_move_velocity = Vector2.ZERO
var move_direction = Vector2.ZERO
var did_arrive = false

func _ready():
	if get_tree().has_group("nav"):
		nav = get_tree().get_nodes_in_group("nav")[0]
	
	



func _physics_process(delta):
	create_path()
	goto()
	
	velocity = move_and_slide(velocity)
	var move_direction = position.direction_to(target_location)
	
func create_path():
	if nav != null and player != null:
		path = nav.get_simple_path(global_position, player.global_position, false)
		
func goto():
	if path.size() > 0:
		velocity = global_position.direction_to(path[1]) * MAX_SPEED


func _on_Area2D_body_entered(body):
	if get_tree().has_group("Player"):
		player = get_tree().get_nodes_in_group("Player")[0]
	
