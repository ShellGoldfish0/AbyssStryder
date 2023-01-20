#We are small, but we are legion
extends KinematicBody2D

onready var player = get_parent().get_node("Lilith")
var target = null
var velocity = Vector2.ZERO
var hit_pos
var laserColor = Color(1, 0.329, 0.289) #this is for the _draw() func
var spawn 
var health = 10

func _ready():
	
	print(player)
	spawn = position
	$hampter.hide() #hides the second sprite of the slug until it dies

func _process(_delta): 
	update()
	if target:
		slugSight()
	else: 
		#this code moves the slug back to spawn when player is no long near it
		velocity = position.direction_to(spawn) * 1
		velocity = move_and_collide(velocity)

#this function is how the slug "sees" the player
func slugSight():
	#godot stores collision and physics info in a "space", space_state is used to get access to that info
	var space_state = get_world_2d().direct_space_state 
	#intersect_ray takes position of the player and slug to see if there is anything between them
	var result = space_state.intersect_ray(position, target.position, [self])
	if result:
		hit_pos = result.position #where the ray cast hits, used for _draw() func
		if result.collider.name == "Lilith": #if player is hit by ray
			velocity = Vector2.ZERO
			if target:
				velocity = position.direction_to(target.position) * 1
				velocity = move_and_collide(velocity)

#this func draws a line to test if the raycasting works
#test code so uncomment when needed
#func _draw():
	#var slug = $Sprite
	#if target:
		#draw_line(slug.position, (hit_pos - position), laserColor)

#when something enters detect node, it is detected
func _on_Detection_body_entered(body):
	if body == player: #if player enters then target is set to player
		target = body

#detects if player "body" exits detect node
func _on_Detection_body_exited(body):
	if body == player:
		target = null

#function used outside of LeSlug scene to damage it
#when hp is gone, sprites are switched and collision for the slug is diasabled
func change_Health(damage):
	health -= damage
	if health <= 0:
		$Sprite.hide()
		$hampter.show()
		$CollisionShape2D.set_deferred("disabled", true)
		$SlugDeathSFX.play()
		set_process(false)
