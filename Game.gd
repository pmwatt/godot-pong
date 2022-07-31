extends Node2D

const ballResource = preload("res://Ball.tscn")

onready var scorePlayer = 0
onready var scoreAI = 0
export var WINNING_SCORE = 55

func _ready():
	spawnBall()

func spawnBall():
	var ball = ballResource.instance()
	ball.position.x = 512
	ball.position.y = 300
	
	# allow ball to be deleted after hitting goal
	$GoalLeft.connect("body_entered", ball, "_on_GoalLeft_body_entered")
	$GoalRight.connect("body_entered", ball, "_on_GoalRight_body_entered")
	
	self.add_child(ball)
	

func checkGameOver():
	if (WINNING_SCORE <= scorePlayer):
		# win
		print("win")
		pass
	if (WINNING_SCORE <= scoreAI):
		# lose
		print("lose")
		pass
	spawnBall()

func _on_GoalLeft_body_entered(body):
	scoreAI += 1
	$Scores/AIScore.text = str(scoreAI)
	checkGameOver()

func _on_GoalRight_body_entered(body):
	scorePlayer += 1
	$Scores/PlayerScore.text = str(scorePlayer)
	checkGameOver()