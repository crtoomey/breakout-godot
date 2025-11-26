extends StaticBody2D


@onready var sprite: Sprite2D = $Sprite2D
@onready var collisionShape: CollisionShape2D = $CollisionShape2D


func hit():
	sprite.visible = false
	collisionShape.disabled = true
