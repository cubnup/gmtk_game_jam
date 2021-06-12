extends Node2D

export(int) var type = 0 
export(String) var d_scene
export(Vector2) var doorpos = Vector2.ZERO
export(Vector2) var switchpos = Vector2.ZERO
onready var vars = get_node("/root/global")
onready var switch = $switch
onready var door = $door

# Called when the node enters the scene tree for the first time.
func _ready():
	door.open = false
	door.scene = d_scene
	door.position = doorpos
	switch.position = switchpos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if switch.conducted:
		door.open = true
	if !switch.s_anim.frame == 1 and type == 1:
		door.open = false
