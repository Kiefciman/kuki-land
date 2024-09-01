extends Node2D

var mouse_global_position = [null, null]

func _ready():
	pass # Replace with function body.

func _process(delta):
	mouse_global_position[0] = (floori(get_global_mouse_position().x) + 16) / 32
	mouse_global_position[1] = (floori(get_global_mouse_position().y) + 16) / 32
	self.global_position.x = mouse_global_position[0] * 32
	self.global_position.y = mouse_global_position[1] * 32
	#print(mouse_global_position)
