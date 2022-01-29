extends Node2D


export var min_pos = 10000
export var max_pos = -3000

onready var anim = $TransitionPlayer

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
	else:
		
		$Dim1/Player.set_collision_mask_bit(1,true)
		$Dim1/Player.set_collision_mask_bit(2,false)
		$Dim1/Tile1.modulate.a = 1
		$Dim2/Tile2.modulate.a = 0


func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		"fade_in":
			Global.alternate_dim = !Global.alternate_dim
			swap_entity_collisions()
			anim.play("fade_out")
			
