extends Character

onready var Stab = $Hitbox
onready var hurtbox = get_node("Hurtbox")
var stats = Stats


func _ready():
	pass

func _physics_process(delta: float) ->void:
	var mouse_direction: Vector2 = (get_global_mouse_position() - global_position.normalized())
	
	
	
	if mouse_direction.x > position.x and animated_sprite.flip_h:
		animated_sprite.flip_h = false
	elif mouse_direction.x < position.x and not animated_sprite.flip_h:
		animated_sprite.flip_h = true
		
	
	
	
	
	
#START GET_INPUT FUNCTION - CHECKS FOR MOVEMENT INPUTS
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
#END GET_INPUT FUNCTION

#START TAKE_DAMAGE FUNCTION - USED TO TAKE DAMAGE
func take_damage(dam:int) ->void:
	Save.player.Health = Save.player.Health - dam
	Save.save()
	$HealthBar._on_health_updated(Save.player.Health)
	
#END TAKE_DAMAGE FUNCTION








