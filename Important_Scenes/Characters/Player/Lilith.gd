extends Character

var ULT = load("res://Important_Scenes/Characters/Player/Lilith_Ult.tscn")
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
	if Input.is_action_pressed("ui_ult"):
		#if $Ult_Timer.is_stopped():
		#else:
			#print("not charged yet")
		launch_ult()
	if Input.is_action_just_pressed("ui_attack"):
		if $Timer.is_stopped():
			$Timer2.start()
			$Hitbox.monitorable = true
			$Hitbox.monitoring = true
			
			
			
			
	if Input.is_action_just_pressed("Interact") and $RayCast2D.is_colliding():
		print("pressed")
		var collider = $RayCast2D.get_collider()
		
		if collider.has_method("_on_interact") :
			collider._on_interact()
		else:
			return
		
#END GET_INPUT FUNCTION

#START TAKE_DAMAGE FUNCTION - USED TO TAKE DAMAGE
func take_damage(dam:int) ->void:
	Save.player.Health = Save.player.Health - dam
	Save.save()
	$Node2D/HealthBar._on_health_updated(Save.player.Health)
	
#END TAKE_DAMAGE FUNCTION

#START ULT FUNCTION - ULTIMATE ATTACK --- CAN ADD ADITIONAL WAYS TO U;LT OR DIFFERNT KINDS, WITH A PARAMATER?
func launch_ult():
	var placement = get_global_mouse_position()
	var Ult = ULT.instance()
	Ult.position = placement
	get_parent().add_child(Ult)
	$Ult_Timer.start()
#END ULT FUNCTION

#START UPDATE_DAMAGE FUNCTION - ALLOWS DAMAGE VALUES TO BE UPDATED
func update_damage():
	$Hitbox.damage = Save.player.Damage
#END  UPDATE_DAMAGE FUNCTION

#START UPDATE_SPEED FUNCTION - UPDATES PLAYERS MAX SPEED
func update_speed(val):
	max_speed = val
#END UPDATE_SPEED FUNCTION













func _on_Timer2_timeout():
	$Hitbox.monitorable = false
	$Hitbox.monitoring = false
