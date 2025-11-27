extends CharacterBody2D

# i had to watch a tutorial to do this, sorry
var speed = 200
var direction = Vector2.DOWN
var isActive = true
var score = 0
@onready var score_label: Label = $"../ScoreLabel"
@onready var ball: CharacterBody2D = $"."

func _ready() -> void:
	#sets velocity of the ball to down and to the left or right at the start
	randomDownDirection()


func _physics_process(delta: float) -> void:
	if isActive:

		# this returns some info about the object the ball collides with but I don't understand it fully yet
		var collision = move_and_collide(velocity * delta)
	
		# check to see if a collision occurred
		if collision:
			velocity = velocity.bounce(collision.get_normal())
			addSpeed()
			
			if collision.get_collider().has_method("hit"):
				collision.get_collider().hit()
				Global.score += 10
				setScore(Global.score)
			
		if(velocity.y > 0 and velocity.y < 100):
			velocity.y = -200
		
		if velocity.x == 0:
			velocity.x = -200
		
func addSpeed():
	print(velocity)
	if (velocity.x < 0 and velocity.x > -300):
		velocity.x += -1
		print(velocity.x)
		
	if (velocity.x > 0 and velocity.x < 300):
		velocity.x += 1
		print(velocity.x)
		
	if (velocity.y < 0 and velocity.y > -300):
		velocity.y += -1
		print(velocity.y)
		
	if (velocity.y > 0 and velocity.y < 300):
		velocity.y += 1
		print(velocity.y)




func _on_killzone_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		isActive = false
		position = Vector2(480, 360)
		newRound()
		
func newRound():
	if Global.life > 0:
		await get_tree().create_timer(0.5).timeout
		isActive = true
		randomDownDirection()
	else:
		ball.queue_free()
	
func randomDownDirection():
	var num = randi_range(1,2)
	if num == 1:
		velocity = Vector2(speed * -1, speed)
	elif num == 2:
		velocity = Vector2(speed, speed)
		
func setScore(score):
	score_label.text = str(score)
