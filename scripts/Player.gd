extends KinematicBody2D

var speed = 200
var jump_speed = -800
var gravity = 4000
var health = 100


var velocity = Vector2.ZERO

func get_input():
	velocity.x = speed
	
func _physics_process(delta):
	get_input()
	print(speed)
	#print(is_on_floor())
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if Input.is_action_just_pressed("jump"):
		print("Click")
		if is_on_floor():
			velocity.y = jump_speed
			

func _ready():
	pass 
