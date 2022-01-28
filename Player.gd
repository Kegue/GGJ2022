extends KinematicBody2D



export var gravity = 100.0
export var speed = 100.0
export var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	
	var dir_vector = Vector2.ZERO
	if(Input.is_action_pressed("ui_left")):
		dir_vector.x -= 1
	if(Input.is_action_pressed("ui_right")):
		dir_vector.x += 1
	if(Input.is_action_pressed("ui_up")):
		dir_vector.y += 1
	if(Input.is_action_pressed("ui_down")):
		dir_vector.y -= 1
