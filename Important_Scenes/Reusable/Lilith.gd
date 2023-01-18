extends Character

onready var Stab: Area2D = get_node("Hitbox")

func _physics_process(delta: float) ->void:
	var mouse_direction: Vector2 = (get_global_mouse_position() - global_position.normalized())
	
	Stab.knockback_direction = mouse_direction
	
	if mouse_direction.x > position.x and animated_sprite.flip_h:
		animated_sprite.flip_h = false
	elif mouse_direction.x < position.x and not animated_sprite.flip_h:
		animated_sprite.flip_h = true
	
	
	
	
	
func get_input() -> void:
	mov_direction = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		mov_direction += Vector2.DOWN
	if Input.is_action_pressed("ui_up"):
		mov_direction += Vector2.UP
	if Input.is_action_pressed("ui_right"):
		mov_direction += Vector2.RIGHT
	if Input.is_action_pressed("ui_left"):
		mov_direction += Vector2.LEFT
	if Input.is_action_pressed("ui_attack"):
		pass


