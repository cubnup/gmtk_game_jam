extends Node2D

onready var vars = get_node("/root/global")
var clock = 0
onready var water = preload("res://water.tscn")
var rng = RandomNumberGenerator.new()

func _ready():
	pass # Replace with function body.


func _process(delta):
	clock = fmod(clock+1, 60)
	if fmod(clock,1) == 0: pour()
		

func pour():
	var w = water.instance()
	rng.randomize()
	w.position.x += rng.randf_range(-5,5)
	w.position.y += rng.randf_range(-5,5)
	self.add_child(w)
