extends Area2D

signal hit

export var speed = 4000 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready():
	 screen_size = get_viewport_rect().size


func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += 175
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 175
	if Input.is_action_pressed("ui_down"):
		velocity.y += 175
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 175
	position += velocity * delta
	
	
func _on_Player_body_entered(body):
	hide() # Player disappears after being hit.
	emit_signal("hit")
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)

func hit(body):
	pass # Replace with function body.
