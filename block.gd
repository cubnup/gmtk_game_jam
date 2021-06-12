extends RigidBody2D

onready var ani = $ani
onready var coll = $CollisionShape2D
export (int) var state
export (Vector2) var size = Vector2(1,1)
onready var vars = get_node("/root/global")

func _ready():
	coll.scale = coll.scale * size
	ani.scale = ani.scale * size


func _process(delta):
	match state:
		0:
			ani.frame = 0
			set_collision_layer_bit(0,true)
			set_collision_layer_bit(1,true)
			set_collision_mask_bit(0,true)
			set_collision_mask_bit(1,true)
			
			set_collision_layer_bit(3,true)
			set_collision_mask_bit(3,true)
		1: #ano
			ani.frame = 1
			set_collision_layer_bit(0,true)
			set_collision_layer_bit(1,false)
			set_collision_mask_bit(0,true)
			set_collision_mask_bit(1,false)
			
			set_collision_layer_bit(3,false)
			set_collision_mask_bit(3,false)
		2: #catho
			ani.frame = 2
			set_collision_layer_bit(0,false)
			set_collision_layer_bit(1,true)
			set_collision_mask_bit(0,false)
			set_collision_mask_bit(1,true)
			
			set_collision_layer_bit(3,false)
			set_collision_mask_bit(3,false)
		3:
			ani.frame = 3
			set_collision_layer_bit(0,true)
			set_collision_layer_bit(1,true)
			set_collision_mask_bit(0,true)
			set_collision_mask_bit(1,true)
			
			set_collision_layer_bit(3,false)
			set_collision_mask_bit(3,false)
			

