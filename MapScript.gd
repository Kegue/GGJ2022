extends Node2D


export var min_pos = 10000


func  _process(delta):
	if Input.is_action_just_pressed("swap_dim"):
		Global.alternate_dim = !Global.alternate_dim	
		swap_entity_collisions()
	
	if $Dim1/Player.position.y > min_pos:
		$Dim1/Player.position = $Dim1/P1_spawn.position
		print("Reseted player pos")
	

func swap_entity_collisions():
	print("swapped dimension")
	
	if Global.alternate_dim:
		
		for vert in $Dim1/Player.get_node("CollisionPolygon2D").polygon:
			if $Dim1/Tile1/Tilemap1.get_cellv($Dim1/Player.to_local(vert)) != TileMap.INVALID_CELL:
				print("Colliding with the map! Not changing dimensions")
				return
		
		$Dim1/Player.set_collision_layer_bit(1,false)
		$Dim1/Player.set_collision_layer_bit(2,true)
		$Dim1/Tile1.modulate.a = 0.5
		$Dim2/Tile2.modulate.a = 1
	else:
		
		for vert in $Dim1/Player.get_node("CollisionPolygon2D").polygon:
			if $Dim2/Tile2/Tilemap2.get_cellv($Dim1/Player.to_local(vert)) != TileMap.INVALID_CELL:
				print("Colliding with the map! Not changing dimensions")
				return
		$Dim1/Player.set_collision_layer_bit(1,true)
		$Dim1/Player.set_collision_layer_bit(2,false)
		$Dim1/Tile1.modulate.a = 1
		$Dim2/Tile2.modulate.a = 0.5
