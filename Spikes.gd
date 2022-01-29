extends StaticBody2D


export var damage = 1
export var alt_dim = false

var players = []

func _ready():
	if alt_dim:
		collision_layer = 4

func _on_Area2D_body_entered(body):
	if !$Timer.time_left:
		if body.is_in_group("Players"):
			if !body in players:
				players.append(body)
			body.damage(damage)
			$Timer.start()


func _on_Area2D_body_exited(body):
	if body in players:
		players.erase(body)


func _on_Timer_timeout():
	if players.size() != 0:
		for pl in players:
			pl.damage(damage)
