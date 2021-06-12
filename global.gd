extends Node

var conducting = false 
var clock = 0



func _process(delta):
	clock = fmod(clock+1, 60)
