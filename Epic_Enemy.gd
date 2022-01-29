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
	$CollisionPolygon2D.set_deferred("disabled", true)
	$Sides/CollisionShape2D.set_deferred("disabled", true)
	$Top/CollisionShape2D.set_deferred("disabled", true)
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
		
		


func _on_Timer_timeout_death():
	queue_free()


func _on_Top_body_entered(body):
	if body.get_name() == "Player":
		death()

func _on_Sides_body_entered(body):
	if dead == false:
		if body.get_name() == "Player":
			kick =  true

			$AnimatedSprite.play("Kick")
			$Timer2.start()


func _on_Timer2_timeout():
	kick = false
