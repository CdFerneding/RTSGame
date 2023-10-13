extends CharacterBody2D


@export var selected = false
@onready var box = get_node("Box")
@onready var anim = get_node("AnimationPlayer")

@onready var target = position
var follow_cursor = false
var Speed = 100


func _ready():
	set_selected(selected)
	add_to_group("units", true)
	
func set_selected(value):
	selected = value
	box.visible = value

func _input(event):
	if event.is_action_pressed("RightClick"):
		follow_cursor = true
	if event.is_action_released("RightClick"):
		follow_cursor = false

func _physics_process(delta):
	if follow_cursor:
		if selected:
			target = get_global_mouse_position()
			anim.play("Walk Down")
	velocity = position.direction_to(target)*Speed
	
	if position.distance_to(target) > 15:
		move_and_slide()
	else:
		anim.stop()
