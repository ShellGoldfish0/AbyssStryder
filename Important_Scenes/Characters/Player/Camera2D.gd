extends Camera2D

#LEGACY SCRIPT - NO LONGER IN USE.

var player

func _ready():
	player= get_node("res://Important_Scenes/Player.tscn")
	

func _process(delta):
	position.x=player.position.xsa
	position.y=player.position.y
