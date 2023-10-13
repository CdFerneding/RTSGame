extends StaticBody2D

@onready var bar = $ProgressBar
@onready var timer = $Timer

var POP = preload("res://Global/POP.tscn")

var totalTime = 10
var currTime

# Called when the node enters the scene tree for the first time.
func _ready():
	currTime = totalTime
	bar.max_value = totalTime
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if currTime <= 0:
		coinsCollected()


func _on_timer_timeout():
	currTime -= 1
	var tween = get_tree().create_tween()
	tween.tween_property(bar, "value", currTime, 0.0).set_trans(Tween.TRANS_LINEAR)


func coinsCollected():
	Game.Coin += 5
	_ready()
	var pop = POP.instantiate()
	add_child(pop)
	pop.show_value(str(5), false)
	
