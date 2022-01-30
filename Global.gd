extends Node2D


export var alternate_dim:bool = false
<<<<<<< Updated upstream
=======
export var current_stage:int = 0

func next_stage():
	current_stage += 1
	print("Changing to level " + str(current_stage))
	get_tree().change_scene("res://Level" + str(current_stage) + ".tscn")

func get_stage():
	return current_stage
>>>>>>> Stashed changes
