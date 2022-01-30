extends Node2D


export var text : String = ""

var hasEntered


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = text
	hasEntered = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.is_in_group("Players") && !hasEntered:
		$AnimationPlayer.play("text_fill")
		hasEntered = true
