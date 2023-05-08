extends Node2D


var num_enemies: int
var exploSlug = load("res://Important_Scenes/Characters/Enemies/Slug/Slug.tscn")
var needle = load("res://Important_Scenes/Characters/Enemies/Sentry/Sentry.tscn")
var wasp = load("res://Important_Scenes/Characters/Enemies/Wasp/Wasp.tscn")
var enemies = [exploSlug, needle, wasp]

onready var tilemap: TileMap = $Main
onready var entrance: Node2D = $Entrance
onready var door_container: Node2D = $Doors
onready var enemy_positions_container = $EnemyPositions
onready var player_detector: Area2D = $PlayerDetector

func _ready():
	num_enemies = enemy_positions_container.get_child_count()
	
#REDUCES THE COUNTER TO CHECK IF THE ROOM HAS BEEN CLEARED.
func _on_enemy_killed():
	num_enemies -= 1
	if num_enemies == 0:
		_open_doors()

#ITS IN THE NAME 
func _open_doors():
	for door in door_container.get_children():
		door.open()
		
		
		
#PLACES WALLS SO THAT YOU CANNOT RE-ENTER THE SPAWN ROOM.
func _close_entrance():
	for entry_position in entrance.get_children():
		$Bottom.set_cellv($Bottom.world_to_map(entry_position.global_position), 4)
		#tilemap.set_cellv(tilemap.world_to_map(entry_position.global_position), 4)
	
#ADDS THE ENEMIES AT THE PREDETERMINED POINTS.
func _spawn_enemies():
	if num_enemies == 0:
		_open_doors()
		$Descender.visible = true
	else:
		for enemy_position in enemy_positions_container.get_children():
			randomize()
			var rand_enemy = enemies[rand_range(0, enemies.size())].instance()
			rand_enemy.global_position = enemy_position.global_position
			call_deferred("add_child", rand_enemy)
		
#CLOSES ENTERANCE AND SPAWNS ENEMIES
func _on_PlayerDetector_body_entered(body: KinematicBody2D):
	player_detector.queue_free()
	_close_entrance()
	_spawn_enemies()
