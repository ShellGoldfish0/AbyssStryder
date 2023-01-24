extends Character

class_name Enemy

var target = null
var target_location = null
var last_move_velocity = Vector2.ZERO
var target_reached = false
var spawn_position = null

signal target_reached
signal path_changed

onready var stats = $EnemyStats
onready var animation_player = $AnimationPlayer








onready var player = get_parent().get_node("Lilith")
onready var navigation_agent = $NavigationAgent2D





func _ready():
	spawn_position = position
	target_location = position
	navigation_agent.set_target_location(spawn_position)
	
	
	
	
func _physics_process(_delta) -> void:
	navigation_agent.set_target_location(target_location)
	mov_direction = position.direction_to(target_location)
	velocity = mov_direction * max_speed
	navigation_agent.set_velocity(velocity)
	
	if not _arrived_at_location():
		velocity = move_and_slide(velocity)
	elif target_reached:
		target_reached = true
		emit_signal("path_changed", [])
		emit_signal("target_reached")

func chase() -> void:
	
	if position.x > 0 and animated_sprite.flip_h:
		animated_sprite.flip_h = false
	elif position.x < 0 and animated_sprite.flip_h:
		animated_sprite.flip_h = true
		
func _arrived_at_location() -> bool:
	return navigation_agent.is_navigation_finished()


func set_target_location(target1: Vector2) -> void:
	target_reached = false
	navigation_agent.set_target_location(target1)
	

func _on_NavigationAgent2D_path_changed():
	emit_signal("path_changed", navigation_agent.get_nav_path())
	


func _on_NavigationAgent2D_target_reached():
	pass
	

	
func take_damage(dam: int) ->int:
	stats.health -= dam
	return stats.health

func on_death():
	max_speed = 0
	animation_player.play("death")
	$Light2D.enabled = true









	
