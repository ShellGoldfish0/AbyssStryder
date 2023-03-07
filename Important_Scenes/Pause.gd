
extends Node2D
 
var isitpaused = false
#At first the only the pause button will be shown
func _ready():
	$Pause.hide()
	$Resume.hide()

#if the game is paused then the resume button will be shown
# and the pause button will be hidden 

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if isitpaused == false:
			_on_Pause_pressed()
			isitpaused = true
		else:
			_on_Resume_pressed()
			isitpaused = false


#when the pause button is pressed we will get the scene tree and
# set the paused to true

func _on_Pause_pressed():
	get_tree().paused = true

#when the resume button is pressed we will get the scene tree and
# set the paused to false

func _on_Resume_pressed():
	get_tree().paused = false
