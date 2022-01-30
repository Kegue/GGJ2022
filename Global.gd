extends Node2D


export var alternate_dim:bool = false
export var current_stage:int = 0

func next_stage():
	current_stage += 1
	get_tree().change_scene("res://Level" + str(current_stage) + ".tscn")


func play_sound(path):
	var sound_plr = AudioStreamPlayer.new()
	add_child(sound_plr)
	sound_plr.connect("finished",sound_plr,"queue_free")
	sound_plr.stream = load(path)
	sound_plr.play()
