extends Node2D

@onready var unit = preload("res://Unit/unit.tscn")


var housePos = Vector2(300,300)

func _on_yes_pressed():
	var unitPath = get_tree().get_root().get_node("World/Units")
	var worldPath = get_tree().get_root().get_node("World")
#	var MiniMapPath = get_tree().get_root().get_node("World/UI/MiniMap/SubViewportContainer/SubViewport")
#	MiniMapPath._ready()
	
	var unit1 = unit.instantiate()
	
	# random position around the pokecenter
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var randomPosX = rng.randi_range(-50,50)
	var randomPosY = rng.randi_range(-50,50)
	unit1.position = housePos + Vector2(randomPosX, randomPosY)
	
	unitPath.add_child(unit1)
	unit1.name = "Unit"
	# re-calling "get_nodes_in_group" to add the newly spawned unit 
	worldPath.get_units()


func _on_no_pressed():
	# deselect all houses when no is pressed
	var housePath = get_tree().get_root().get_node("World/Houses")
	for i in housePath.get_child_count():
		if housePath.get_child(i).Selected == true:
			housePath.get_child(i).Selected = false
	queue_free()
