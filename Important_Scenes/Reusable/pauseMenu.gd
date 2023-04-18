extends Control

var is_paused = false setget set_is_paused

func _ready():
	set_is_paused(false)
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
			self.is_paused =!is_paused
			

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused



#when the pause button is pressed we will get the scene tree and
# set the paused to true

func _on_Resume_pressed():
	self.is_paused = false


#when the resume button is pressed we will get the scene tree and
# set the paused to false
	
func _on_Restart_pressed():
	get_tree().reload_current_scene()
