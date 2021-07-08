extends StaticBody2D
export var freq:float = 1
export(float) var ballSpeedLower :float= 0
export (float) var ballSpeedHigher:float

export(String,FILE) var ballPath:String
var ball:PackedScene

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	ball = load(ballPath)
	get_node("Timer").wait_time = 1/freq
	get_node("Timer").start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var newBall :RigidBody2D= ball.instance()
	var speed:float
	if ballSpeedLower>ballSpeedHigher:
		speed = ballSpeedLower
	else:
		speed = rand_range(ballSpeedLower,ballSpeedHigher)
	var selfDirection = Vector2(cos(rotation), sin(rotation))
	add_child(newBall)
	newBall.linear_velocity = selfDirection.normalized()*speed
