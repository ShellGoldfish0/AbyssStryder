extends KinematicBody2D

class_name Character


const FRICTION: float = .15

export(int) var acceleration: int 
export(int) var max_speed: int 

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
	




	
