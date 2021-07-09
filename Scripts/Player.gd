extends KinematicBody2D
export var rotationalSpeed:float
export var rotationalDrag:float=0.2
export var forwardThrustSpeed:float =1000
export var rotationalThrustSpeed:float = 1

var velocity :Vector2 = Vector2.ZERO
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	# handling rotation
	if Input.is_action_pressed("thrust_right"):
		rotationalSpeed+=rotationalThrustSpeed*delta
		get_node("RightSmoke").emitting = true
	else:
		get_node("RightSmoke").emitting = false

	if Input.is_action_pressed("thrust_left"):
		rotationalSpeed-=rotationalThrustSpeed*delta
		get_node("LeftSmoke").emitting = true
	else:
		get_node("LeftSmoke").emitting = false
	
	rotationalSpeed = lerp(rotationalSpeed, 0, rotationalDrag)
	rotate(rotationalSpeed)
	velocity = velocity.rotated(rotationalSpeed)
	
	if Input.is_action_pressed("thrust"):
		var dir = Vector2(cos(rotation), sin(rotation))
		velocity += dir*forwardThrustSpeed
		get_node("ForwardSmoke").emitting = true
		
	else:
		get_node("ForwardSmoke").emitting = false
	
	velocity = move_and_slide(velocity)
