extends KinematicBody2D

onready var ano = self.get_parent().get_node("ano")
onready var c_area = $c_area
onready var c_anim = $c_anim
onready var vars = get_node("/root/global")
var velocity = Vector2.ZERO
var powered = false
var c_coll
var rng = RandomNumberGenerator.new()

func _ready():
	pass


func _process(delta):
	velocity = velocity.clamped(2000)
	velocity *= 0.9
	if Input.is_action_pressed("rclick"):
		velocity += (get_global_mouse_position()-global_position)
	move_and_slide(velocity)
	if vars.conducting:
		rng.randomize()
		global_rotation = rng.randf_range(-.2,.2)
		c_anim.frame = 1
		velocity += (global_position-ano.global_position).rotated(PI/1.5)
		if global_position.distance_to(ano.global_position) > 30:
			velocity += (ano.global_position-global_position)
	else:
		global_rotation = 0
		c_anim.frame = 0
	c_coll = move_and_collide(Vector2.ZERO)
	if c_coll:
		if c_coll.collider.name.begins_with("camwall"):
			velocity = velocity.bounce(c_coll.normal)


func _on_c_area_body_entered(body):
	if body == ano:
		vars.conducting = true
		powered = true
func _on_c_area_body_exited(body):
	if body == ano:
		vars.conducting = false
		powered = false
