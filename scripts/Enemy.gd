extends KinematicBody2D

var speed = 180
var jump_speed = -800
var gravity = 4000
var health = 100
var modifier = 1


var velocity = Vector2.ZERO

func get_input():
	velocity.x = speed
	
func _physics_process(delta):
	get_input()
	#print(is_on_floor())
	if position.y < 1000:
		modifier = 1
	else:
		modifier = 0
	velocity.y += gravity * delta * modifier
	velocity = move_and_slide(velocity, Vector2.UP)
	print(velocity.y)
			

func _ready():
	pass 
