extends StaticBody2D

var totalTime = 10
var currTime
var units = 0
@onready var bar = $ProgressBar
@onready var timer = $Timer


func _ready():
	currTime = totalTime
	bar.max_value = totalTime

func _process(delta):
	bar.value = currTime
	# check if tree has been completely chopped 
	if currTime <= 0:
		treeChopped()

func _on_chop_area_body_entered(body):
	if "Unit" in body.name:
		units += 1
		startChopping()

func _on_chop_area_body_exited(body):
	if "Unit" in body.name:
		units -= 1
		if units <= 0:
			timer.stop()


func _on_timer_timeout():
	var chopSpeed = 1*units
	currTime -= chopSpeed
	# tweens are used to smooth animations
	var tween = get_tree().create_tween()
	# tween property anmates (here bar and value to current time, 
	# this transformation will take 0.4 seconds)
	# .set_trans describes the style of the animation
	tween.tween_property(bar, "value", currTime, 0.4).set_trans(Tween.TRANS_LINEAR)

func treeChopped():
	Game.Wood += 1
	_ready()
	
func startChopping():
	timer.start()
