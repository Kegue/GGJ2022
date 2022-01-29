extends Node2D


export var dist_btwn_hearts = 90
var ui_heart = preload("res://UI_Heart.tscn")

var hearts = []
var coins = 0

func setup_HUD(max_hearts):
	update_coins(coins)
	
	for i in hearts:
		i.queue_free()
	
	print("max hearts %d" % max_hearts)
	for i in range(max_hearts):
		print(i)
		var heart = ui_heart.instance()
		heart.position = $Origin.position + Vector2(i*dist_btwn_hearts,0)
		hearts.append(heart)
		add_child(heart)
		



func update_hp(hp):
	if hp < 0:
		hp = 0
	if hp > hearts.size():
		setup_HUD(hp)
		
	for i in range(hearts.size()):
		if i < hp:
			hearts[i].get_node("Full").visible = true
			hearts[i].get_node("Empty").visible = false
		else:
			hearts[i].get_node("Full").visible = false
			hearts[i].get_node("Empty").visible = true

func update_coins(coins):
	$Coins.text = String(coins)
