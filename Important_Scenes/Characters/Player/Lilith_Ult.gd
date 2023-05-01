extends Node2D


#ULT TIMER 

func _ready():
	$Timer.start()



func _on_Timer_timeout():
	queue_free()
