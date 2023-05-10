extends Character

class_name Enemy

var target = null
var target_location = null
var last_move_velocity = Vector2.ZERO
var target_reached = false
var spawn_position = null
var nav
var path
signal target_reached
signal path_changed

onready var stats = $EnemyStats
onready var animation_player = $AnimationPlayer







var player = null







func _ready():
	pass
	
func _physics_process(_delta) -> void:
	pass


func take_damage(dam: int) ->int:
	$EnemyStats.health -= dam
	if $EnemyStats.health <= 0:
		var temp = get_parent()
		temp._on_enemy_killed()
		queue_free()
	return stats.health


	
func set_spawn_location():
	spawn_position = position












	
