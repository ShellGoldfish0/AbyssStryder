extends StaticBody2D


func _on_interact():
	print("touched")
	$Light.enabled = true
	

