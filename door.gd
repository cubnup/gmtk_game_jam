extends RigidBody2D

var scene
onready var d_anim = $d_anim
var open = false
var conducted = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if open == true: 
		d_anim.frame = 1
	else: d_anim.frame = 0
	if conducted and open:
		get_tree().change_scene(scene)


func power():
	conducted = true
func unpower():
	conducted = false
