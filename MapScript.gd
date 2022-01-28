extends Node2D


export var min_pos = 10000


func  _process(delta):
	if Input.is_action_just_pressed("swap_dim"):
		Global.alternate_dim = !Global.alternate_dim	
		swap_entity_collisions()
	
	if $Player.position.y > min_pos:
		$Player.position = $P1_spawn.position
		print("Reseted player pos")
	
	print($Player.position)
	

func swap_entity_collisions():
	print("swapped dimension")
	if Global.alternate_dim:
		$Player.set_collision_layer_bit(1,false)
		$Player.set_collision_layer_bit(2,true)
		$Tile1.modulate.a = 0.5
		$Tile2.modulate.a = 1
	else:
		$Player.set_collision_layer_bit(1,true)
		$Player.set_collision_layer_bit(2,false)
		$Tile1.modulate.a = 1
		$Tile2.modulate.a = 0.5
