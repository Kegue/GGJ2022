extends KinematicBody2D

const GRAVITY = 10
const SPEED = 50
const FLOOR = Vector2(0, -1)
const LEFT = -1
const RIGHT = 1



var velocity = Vector2()
var direction = RIGHT

var dead = false
var kick = false


func _ready():
	pass

func death():
	dead = true
	$AnimatedSprite.play("Dead")
	$CollisionPolygon2D.disabled = true
	$Timer.start()

func _physics_process(delta):
	if !dead && !kick:
		if direction == RIGHT:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
			
		$AnimatedSprite.play("Walk")
		
		velocity.x = SPEED * direction
		velocity.y += GRAVITY
		
		velocity = move_and_slide(velocity, FLOOR)
		
		if is_on_wall():
			direction = -direction
			$RayCast2D.position.x *=-1
			
		if $RayCast2D.is_colliding() == false:
			direction = -direction
			$RayCast2D.position.x *=-1
		
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			if collision.collider.name == "Player":
				kick =  true
				$AnimatedSprite.play("Kick")


func _on_Timer_timeout_death():
	queue_free()
