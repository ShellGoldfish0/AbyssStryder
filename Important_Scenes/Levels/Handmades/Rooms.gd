extends Node


const SPAWN_ROOMS: Array = [preload("res://Important_Scenes/Levels/Handmades/Spawn Rooms/SpawnRoom1.tscn")]
const MID_ROOMS: Array = [preload("res://Important_Scenes/Levels/Handmades/Floor Rooms/Room0.tscn"), preload("res://Important_Scenes/Levels/Handmades/Floor Rooms/Room1.tscn"),preload("res://Important_Scenes/Levels/Handmades/Floor Rooms/Room3.tscn"), preload("res://Important_Scenes/Levels/Handmades/Floor Rooms/Room2.tscn"), preload("res://Important_Scenes/Levels/Handmades/Floor Rooms/Room4.tscn")]
const END_ROOMS: Array = [preload("res://Important_Scenes/Levels/Handmades/End Rooms/End_Room1.tscn")]




onready var player = get_parent().get_node("Lilith")



export(int) var num_rooms: int = 5
var previous_room
var room_count = 0

func _ready():
	_spawn_rooms()
	
	
	

func _spawn_rooms():
	randomize()
	var room: Node2D
	if room_count == 0:
		room = SPAWN_ROOMS[randi() % SPAWN_ROOMS.size()].instance()
	else:
		if room_count < num_rooms:
			room = MID_ROOMS[randi() % MID_ROOMS.size()].instance()
			if room == previous_room:
				room = MID_ROOMS[randi() % MID_ROOMS.size()].instance()
		else:
			room = END_ROOMS[randi() % END_ROOMS.size()].instance()
	add_child(room)
	player.position = room.get_node("Spawn").position
	previous_room = room
	room_count +=1


func delete():
	previous_room.queue_free()

""""
onready var player = get_parent().get_node("Lilith")

const TILE_SIZE: int = 64
const FLOOR_TILE_INDEX: int = 0
const RIGHT_WALL_TILE_INDEX: int = 4
const LEFT_WALL_TILE_INDEX: int = 12


func _ready():
	_spawn_rooms()
	
	
func _spawn_rooms():
	var previous_room
	randomize()
	for i in range(0, num_rooms):
		var room: Node2D
		
		if i == 0:
			room = SPAWN_ROOMS[randi() % SPAWN_ROOMS.size()].instance()
			_spawn_player(room)
		else:
			if i == num_rooms - 1:
				room = END_ROOMS[randi() % END_ROOMS.size()].instance()
			else:
				room = MID_ROOMS[randi() % MID_ROOMS.size()].instance()
				
			var previous_room_tilemap: TileMap = previous_room.get_node("Main")
			var previous_room_door: StaticBody2D = previous_room.get_node("Doors/Door")
			var exit_tile_pos: Vector2 = previous_room_tilemap.world_to_map(previous_room_door.position) + Vector2.UP * 2
			
			var corridor_height: int = randi() %5 + 2
			for y in corridor_height:
				previous_room_tilemap.set_cellv(exit_tile_pos + Vector2(-2, -y), LEFT_WALL_TILE_INDEX)
				previous_room_tilemap.set_cellv(exit_tile_pos + Vector2(-1, -y), FLOOR_TILE_INDEX)
				previous_room_tilemap.set_cellv(exit_tile_pos + Vector2(0, -y), FLOOR_TILE_INDEX)
				previous_room_tilemap.set_cellv(exit_tile_pos + Vector2(1, -y), RIGHT_WALL_TILE_INDEX)
				
			var room_tilemap: TileMap = room.get_node("Bottom")
			room.position = room.get_node("Entrance/Position2D").position
			
		add_child(room)
		previous_room = room
		
func _spawn_player(pos):
	player.position = pos.get_node("Spawn").position
	
	print(player.position)
"""
