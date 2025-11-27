extends Control



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.getHighScore(Global.score)
	var highscoreLabel = get_child(1)
	highscoreLabel.text = str(Global.highScore)
	var yourScoreLabel = get_child(3)
	yourScoreLabel.text = str(Global.score)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_restart_pressed() -> void:
	Global.score = 0
	Global.life = 3
	get_tree().change_scene_to_file("res://scenes/main.tscn")
