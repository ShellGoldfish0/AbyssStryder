
extends KinematicBody2D


export var speed = 600
#as there are multiple slugs, they're put into a group
#the node value of the slugs are put into an array
onready var enemies = get_tree().get_nodes_in_group("enemies")
var kamenRide = "Sadge Man" #keeps track of what player looks like
var target = null
var stats = PlayerStats

func _ready():
	stats.connect("no_health", self, "queue_free")

func _physics_process(_delta):
	#lines 12-15 are inputs determining how to move the player
	var vel = Vector2(
		int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")),
		int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
		)
		
	#lines 18-26 interact with the torch
	if Input.is_action_just_pressed("Interact") and $RayCast2D.is_colliding():
		
		print("pressed")
		var collider = $RayCast2D.get_collider()
		
		if collider.has_method("_on_interact") :
			collider._on_interact()
		else:
			return
	
	move_and_slide(vel * speed) #code that changes the player's position in space
	
	#this block changes what the player looks like
	#if Input.is_action_just_pressed("ui_space"):
		#if kamenRide == "Sadge Man":
			#$Sprite.hide()
			#$BingChillingSFX.play()
			#kamenRide = "Bing Chilling"
		#else:
			#$Sprite.show()
			#kamenRide = "Sadge Man"

#when something enters attackRadius node, it is detected
func _on_attackRadius_body_entered(body):
	#sees if what entered the node is an enemy
	for enemy in enemies:
		if body == enemy:
			target = enemy
	if target && kamenRide == "Bing Chilling": #if enemy is in body and player is john cena then attack
		target.change_Health(10)
		

#when enemy leaves the body, player no longer has a target
func _on_attackRadius_body_exited(body):
	for enemy in enemies:
		if body == enemy:
			target = null
			
#Update player helath when entering enemy hurtbox
func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	hurtbox.start_invincibility(0.6)
	
	

