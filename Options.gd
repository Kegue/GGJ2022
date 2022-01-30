extends Control


func _ready():
	if settings.music_enabled == false:
		$Music/OnOf/CheckButton.pressed = false



func _on_Music_toggled(button_pressed):
	settings.music_enabled = !settings.music_enabled


func _on_Back_pressed():
	get_tree().change_scene("res://Menu.tscn")
