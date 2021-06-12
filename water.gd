extends RigidBody2D

onready var vars = get_node("/root/global")
onready var w_spr = $w_spr
var wclock = 0
var conducted = false
var powered = false
var bodies = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	wclock += 1
	if wclock == 120:
		self.queue_free()
	var p = 0
	for i in bodies:
		if i.powered:
			powered = true
	if powered:
		w_spr.frame = 1
	else: w_spr.frame = 0


func power():
	conducted = true
func unpower():
	conducted = false


func _on_w_area_body_entered(body):
	if body.has_method("power") and powered:
		body.power()
	bodies.append(body)


func _on_w_area_body_exited(body):
	if body.has_method("power"):
		body.unpower()
	bodies.erase(body)
