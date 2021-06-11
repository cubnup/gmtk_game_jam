extends Button

export(String) var scene

func _ready():
	pass

func _process(delta):
	if pressed:
		get_tree().change_scene(scene)
