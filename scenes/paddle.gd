extends StaticBody2D

var direction = 0
var speed = 300
var screenSize = 960



func _process(delta: float) -> void:

	#pretty self explanatory, we move up or down based on input
	if Input.is_action_pressed("move_left"):
		direction = -1
	elif Input.is_action_pressed("move_right"):
		direction = 1
	else:
		direction = 0
		
	position.x += direction * delta * speed
	position.x = clamp(position.x, 0, screenSize)
