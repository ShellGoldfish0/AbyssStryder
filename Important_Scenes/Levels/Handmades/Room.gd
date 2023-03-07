extends Node2D


var num_enemies: int
var exploSlug = load("res://Important_Scenes/Reusable/Slug.tscn")
var needle = load("res://Important_Scenes/Reusable/Sentry.tscn")
var wasp = load("res://Important_Scenes/Reusable/Wasp.tscn")
var enemies = [exploSlug, needle, wasp]

onready var tilemap: TileMap = $Main
onready var entrance: Node2D = $Entrance
onready var door_container: Node2D = $Doors
onready var enemy_positions_container = $EnemyPositions
onready var player_detector: Area2D = $PlayerDetector

func _ready():
	num_enemies = enemy_positions_container.get_child_count()
	

func _on_enemy_killed():
	num_enemies -= 1
	if num_enemies == 0:
		_open_doors()
		print("ick")
func _open_doors():
	for door in door_container.get_children():
		door.open()
		
		
		
func _close_entrance():
	#for entry_position in entrance.get_children():
		#tilemap.set_cellv(tilemap.world_to_map(entry_position.global_position), 1)
		#tilemap.set_cellv(tilemap.world_to_map(entry_position.global_position) + Vector2.UP, 2)\
	pass
func _spawn_enemies():
	for enemy_position in enemy_positions_container.get_children():
		randomize()
		var rand_enemy = enemies[rand_range(0, enemies.size())].instance()
		rand_enemy.global_position = enemy_position.global_position
		call_deferred("add_child", rand_enemy)
		

func _on_PlayerDetector_body_entered(body: KinematicBody2D):
	player_detector.queue_free()
	_close_entrance()
	_spawn_enemies()
