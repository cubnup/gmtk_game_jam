extends KinematicBody2D

onready var catho = self.get_parent().get_node("catho")
onready var a_area = $a_area
onready var a_anim = $a_anim
onready var vars = get_node("/root/global")
var velocity = Vector2.ZERO
var c_coll
var rng = RandomNumberGenerator.new()
var powered = false

func _ready():
	pass


func _process(delta):
	velocity = velocity.clamped(2000)
	velocity *= 0.9
	if Input.is_action_pressed("lclick"):
		velocity += (get_global_mouse_position()-global_position)
	move_and_slide(velocity)
	if vars.conducting:
		rng.randomize()
		global_rotation = rng.randf_range(-.2,.2)
		a_anim.frame = 1
		velocity += (global_position-catho.global_position).rotated(PI/1.5)
		if global_position.distance_to(catho.global_position) > 30:
			velocity += (catho.global_position-global_position)
	else:
		global_rotation = 0
		a_anim.frame = 0
	c_coll = move_and_collide(Vector2.ZERO)
	if c_coll:
		if c_coll.collider.name.begins_with("camwall"):
			velocity = velocity.bounce(c_coll.normal)



func _on_a_area_body_entered(body):
	if body == catho:
		vars.conducting = true
		powered = true
func _on_a_area_body_exited(body):
	if body == catho:
		vars.conducting = false
		powered = false
