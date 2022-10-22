extends Node2D


onready var tile1 = preload("res://Scenes/Tile1.tscn")
onready var tile2 = preload("res://Scenes/Tile2.tscn")
onready var tile3 = preload("res://Scenes/Tile3.tscn")
onready var tile4 = preload("res://Scenes/Tile4.tscn")
onready var tile5 = preload("res://Scenes/Tile5.tscn")
onready var player = $Player
onready var enemy = $Enemy

var speedboost = 1

func _ready():
	pass

func _physics_process(delta):
	move_child(player,get_child_count())
	move_child(enemy,get_child_count())

func spawn_tile(position):
	randomize()
	randomize()
	var number = int(rand_range(1,6))
	var tile = tile1.instance()
	var pos
	if number == 1:
		tile = tile1.instance()
	elif number == 2:
		tile = tile2.instance()
	elif number == 3:
		tile = tile3.instance()
	elif number == 4:
		tile = tile4.instance()
	else:
		tile = tile5.instance()
	pos = Autoload.current_tile + position
	tile.position.x = pos
	tile.position.y = 1056
	Autoload.current_tile = pos
	call_deferred("add_child", tile)



func _on_Spawner_body_entered(body):
	if not body is KinematicBody2D:
		return
	if body.name == "Player":
		spawn_tile(0)
		


func _on_Timer_timeout():
	if $Player.speed < 1000:
		
		$Player.speed += speedboost
		$Enemy.speed += speedboost
		speedboost = speedboost*2
	else:
		$Player.speed = 1000
		$Enemy.speed = 700
