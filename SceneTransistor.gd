extends CanvasLayer


var new_scene: String

func start_transition_to(path_to_scene: String) -> void:
	new_scene = path_to_scene
	change_scene()
	
	
func change_scene() ->void:
	assert(get_tree().change_scene(new_scene) == OK)
