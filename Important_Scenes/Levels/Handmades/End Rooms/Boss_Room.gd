extends Node2D
class_name Boss_Room

onready var hpbuff = preload("res://Important_Scenes/Items/Health_Crystal.tscn")
const tier_one = [preload("res://Important_Scenes/Characters/Enemies/Wendigo/Wendigo.tscn")]
onready var tilemap: TileMap = $Main
onready var entrance: Node2D = $Entrance
onready var door_container: Node2D = $Doors
onready var enemy_positions_container = $EnemyPositions
onready var player_detector: Area2D = $PlayerDetector
var num_enemies: int


func _ready():
	num_enemies = enemy_positions_container.get_child_count()


func _on_enemy_killed():
	num_enemies -= 1
	if num_enemies == 0:
		_open_doors()
		
func _open_doors():
	for door in door_container.get_children():
		door.open()
		
		
		
func _close_entrance():
	for entry_position in entrance.get_children():
		$Bottom.set_cellv($Bottom.world_to_map(entry_position.global_position), 4)
		#tilemap.set_cellv(tilemap.world_to_map(entry_position.global_position), 4)
	
func _spawn_enemies():
	if num_enemies == 0:
		_open_doors()
		$Descender.visible = true
	else:
		for enemy_position in enemy_positions_container.get_children():
			randomize()
			var rand_enemy = tier_one[rand_range(0, tier_one.size())].instance()
			rand_enemy.global_position = enemy_position.global_position
			call_deferred("add_child", rand_enemy)
		
func _spawn_health():
	for health_node in $Health.get_children():
		var hp_placed = hpbuff.instance()
		hp_placed.global_position = health_node.global_position
		call_deferred("add_child", hp_placed)
		

func _on_PlayerDetector_body_entered(body: KinematicBody2D):
	player_detector.queue_free()
	_close_entrance()
	_spawn_enemies()
	_spawn_health()

