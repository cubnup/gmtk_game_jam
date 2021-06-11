extends Node2D


onready var vars = get_node("/root/global")
onready var elec = $electricity
onready var ano = $ano
onready var catho = $catho
onready var e_area = $e_area
onready var field = $e_area/field
var avgpos = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	avgpos = (ano.global_position + catho.global_position)/2
	e_area.global_position = avgpos
	elec.global_position = avgpos
	if vars.conducting:
		elec.emitting = true
		field.emitting = true
	else:
		elec.emitting = false
		field.emitting = false


func _on_e_area_body_entered(body):
	if vars.conducting: 
		pass


func _on_e_area_body_exited(body):
	pass
