extends SubViewport

@onready var camera = $Camera


var pokecenter = preload("res://Houses/pokecenter.tscn")
var unit = preload("res://Unit/unit.tscn")
var tree = preload("res://World Objects/tree.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	updateMap()

func updateMap():
	var housesPath = get_tree().get_root().get_node("World/Houses")
	var unitsPath = get_tree().get_root().get_node("World/Units")
	var treePath = get_tree().get_root().get_node("World/Objects")
	
	for i in housesPath.get_child_count():
		var house = pokecenter.instantiate()
		add_child(house)
		house.position = housesPath.get_child(i).position
	for i in unitsPath.get_child_count():
		var newUnit = unit.instantiate()
		get_node("Units").add_child(newUnit)
	for i in treePath.get_child_count():
		var newPokecenter = tree.instantiate()
		add_child(newPokecenter)
		newPokecenter.position = treePath.get_child(i).position

func _process(delta):
	var CameraPath = get_tree().get_root().get_node("World/Camera")
	var unitsPath = get_tree().get_root().get_node("World/Units")
	camera.position = CameraPath.position/2
	camera.zoom = CameraPath.zoom/2
	
	var UnitsTotal = get_node("Units")
	print(UnitsTotal)
	for i in unitsPath.get_child_count():
		UnitsTotal.get_child(i).position = unitsPath.get_child(i).position/2
