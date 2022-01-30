extends Node2D


export var min_pos = 1500
export var max_pos = -3000

onready var anim = $TransitionPlayer
onready var textAnim = $TextAnimator

func _ready():
	swap_entity_collisions()
	swap_entity_collisions()

func  _process(delta):
	if Input.is_action_just_pressed("swap_dim"):
		anim.play("fade_in")
	
	if $Dim1/Player.position.y > min_pos || $Dim1/Player.position.y < max_pos:
		$Dim1/Player.position = $Dim1/P1_spawn.position
		print("Reseted player pos")
	

func swap_entity_collisions():
	print("swapped dimension")
	
	if Global.alternate_dim:
		
		$Dim1/Player.set_collision_mask_bit(1,false)
		$Dim1/Player.set_collision_mask_bit(2,true)
		$Dim1/Tile1.modulate.a = 0
		$Dim2/Tile2.modulate.a = 1
		$ParallaxBackground/ParallaxLayer/Sprite.visible = false
		$ParallaxBackground/ParallaxLayer2/Sprite.visible = false
		$ParallaxBackground/ParallaxLayer3/Sprite.visible = true
		$ParallaxBackground/ParallaxLayer4/Sprite.visible = true
	else:
		
		$Dim1/Player.set_collision_mask_bit(1,true)
		$Dim1/Player.set_collision_mask_bit(2,false)
		$Dim1/Tile1.modulate.a = 1
		$Dim2/Tile2.modulate.a = 0
		$ParallaxBackground/ParallaxLayer/Sprite.visible = true
		$ParallaxBackground/ParallaxLayer2/Sprite.visible = true
		$ParallaxBackground/ParallaxLayer3/Sprite.visible = false
		$ParallaxBackground/ParallaxLayer4/Sprite.visible = false


func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		"fade_in":
			Global.alternate_dim = !Global.alternate_dim
			swap_entity_collisions()
			anim.play("fade_out")
			
