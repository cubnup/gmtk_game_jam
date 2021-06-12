extends Camera2D

export (float) var minx = -1000
export (float) var maxx = 1000
var t = 0.0
var initial_mouse_position = Vector2.ZERO
onready var vars = get_node("/root/global")

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("reload"):get_tree().change_scene(get_tree().current_scene.filename)
	
	if Input.is_action_just_pressed("mclick"):
		t = 0.0
		initial_mouse_position = get_global_mouse_position()
	if Input.is_action_pressed("mclick"): 
		global_position = ((get_global_mouse_position()-initial_mouse_position) * -0.5).clamped(16) + global_position
		t += 0.05 if t <= 1 else 0
	if global_position.x < minx: global_position.x = minx
	if global_position.x > maxx: global_position.x = maxx
	

	global_position.y *= 0.5
