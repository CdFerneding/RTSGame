extends StaticBody2D

var mouseEntered = false
@onready var select = get_node("Selected")
var Selected = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	select.visible = Selected


func _input(event):
	if event.is_action("LeftClick"):
		if mouseEntered:
			Selected = !Selected
			if Selected:
				Game.spawnUnitOverlay(position)


func _on_mouse_entered():
	mouseEntered = true


func _on_mouse_exited():
	mouseEntered = false
