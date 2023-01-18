extends KinematicBody2D

class_name Character


const FRICTION: float = .15

export(int) var hp: int = 2
export(int) var acceleration: int = 50
export(int) var max_speed: int = 200

#onready var state_machine: Node = get_node("StateMachine")
onready var animated_sprite = $AnimatedSprite


var mov_direction: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	velocity = move_and_slide(velocity)
	velocity = lerp(velocity, Vector2.ZERO, FRICTION)

func move() -> void:
	mov_direction = mov_direction.normalized()
	velocity += mov_direction * acceleration
	velocity = velocity.limit_length(max_speed)
	

func take_damage(dam: int) -> void:
	hp -= dam
	#state_machine.set_state(state_machine.states.hurt)
	
	
	
