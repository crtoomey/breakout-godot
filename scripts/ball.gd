extends CharacterBody2D

# i had to watch a tutorial to do this, sorry
var speed = 200
var direction = Vector2.DOWN
var isActive = true

func _ready() -> void:
	#sets velocity of the ball to down and to the left at the start
	velocity = Vector2(speed * -1, speed)


func _physics_process(delta: float) -> void:
	if isActive:

		# this returns some info about the object the ball collides with but I don't understand it fully yet
		var collision = move_and_collide(velocity * delta)
	
		# check to see if a collision occurred
		if collision:
			velocity = velocity.bounce(collision.get_normal())
			
		if(velocity.y > 0 and velocity.y < 100):
			velocity.y = -200
		
		if velocity.x == 0:
			velocity.x = -200
		
