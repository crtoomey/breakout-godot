extends Node2D

var columns = 16
var rows = 10
var margin = 60
var life = 3

@onready var brickObject = preload("res://scenes/block.tscn")
@onready var button: Button = $Button
@onready var heart_ui: Sprite2D = $HeartUI

func _ready() -> void:
	loadLevel()
	Engine.time_scale = 0
	




func loadLevel():
	
	
	for r in rows:
		for c in columns:
			var newBrick = brickObject.instantiate()
			add_child(newBrick)
			var sprite = newBrick.get_child(0)
			sprite.region_enabled = true
			if r < 2:
				sprite.region_rect = Rect2(0,0,60,20)
			elif r < 4:
				sprite.region_rect = Rect2(60,0,60,20)
			elif r < 6:
				sprite.region_rect = Rect2(0,20,60,20)
			elif r < 8: 
				sprite.region_rect = Rect2(60,20,60,20)
			else:
				sprite.region_rect = Rect2(0,40,60,20)
			newBrick.position = Vector2((60 * c), margin + (20 * r))


func _on_button_pressed() -> void:
	Engine.time_scale = 1
	button.visible = false
	button.disabled = true



func _on_killzone_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		life -= 1
		if life == 3:
			print(life)
			var heartTexture = load("res://assets/breakout hearts 3 hearts.png")
			heart_ui.texture = heartTexture
		elif life == 2:
			print(life)
			var heartTexture = load("res://assets/breakout hearts 2 hearts.png")
			heart_ui.texture = heartTexture
		elif life == 1:
			print(life)
			var heartTexture = load("res://assets/breakout hearts 1 heart.png")
			heart_ui.texture = heartTexture
		else:
			print(life)
			print("Game over")
			gameOver()
		
func gameOver():
	heart_ui.queue_free()
	await get_tree().create_timer(1.1).timeout
	get_tree().reload_current_scene()


	
