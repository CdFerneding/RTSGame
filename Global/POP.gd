extends Label

var travel = Vector2(0,-50)
var duration = 1
var spread = PI/2


func show_value(value, crit):
	var tween = create_tween()
	text = "+ " + str(value) + "g"
	pivot_offset = size/4
	
	var movement = travel.rotated(randi_range(-spread/2, spread/2))
	
	# Animate Position of label
	tween.tween_property(self, "position", position + movement, duration)
	
	# Animate the fade out (in Visibility")
	tween.tween_property(self, "modulate:a", 0.0, duration)
	
	if crit == true:
		modulate = Color(1,0,0)
		scale = scale*2
		tween.tween_property(self, "scale", scale, 0.4)
		
	tween.play()
	# Once the animation is done, the object is freed
	tween.tween_callback(self.queue_free)
