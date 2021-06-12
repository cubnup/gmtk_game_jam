extends RigidBody2D

onready var s_anim = $s_anim
var conducted = false
var powered = false
onready var vars = get_node("/root/global")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if conducted:
		s_anim.frame = 1
	if fmod(vars.clock,20) == 0  and !conducted:
		s_anim.frame = 0 


func power():
	conducted = true
func unpower():
	conducted = false
