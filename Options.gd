extends Control


func _ready():
	$Music/OnOf/CheckButton.pressed = settings.music_enabled
	$Fx/OnOf/CheckButton.pressed = settings.fx_enabled
	$Fx/OnOf/CheckButton.pressed = settings.stress



func _on_Music_toggled(button_pressed):
	settings.music_enabled = $Music/OnOf/CheckButton.pressed
	if settings.music_enabled == true:
		Music.play()
	else:
		Music.stop()


func _on_Back_pressed():
	get_tree().change_scene("res://Menu.tscn")


func _on_FX_toggled(button_pressed):
	settings.fx_enabled = $Music/OnOf/CheckButton.pressed


func _on_stress_toggled(button_pressed):
	settings.stress = $Stress/CheckButton.pressed


func _on_MusicVol_value_changed(value):
	settings.music_volume = value
	Music.set_volume_db(value-30)


func _on_FxVol_value_changed(value):
	settings.fx_volume = value
