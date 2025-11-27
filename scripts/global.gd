extends Node

var life = 3
var score = 0
var highScore = 0

func getHighScore(newScore):
	print(newScore)
	if newScore >= highScore:
		highScore = newScore
		print(highScore)
	else:
		highScore = highScore
		
	
