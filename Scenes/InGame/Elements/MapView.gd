extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var state = "Hide"
var mouse_movement = Vector2(0,0)
var hold = false
onready var last_pos = $Camera2D.position
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if state == "Show" and hold == true:
		var current_pos = (-1*mouse_movement)+$Camera2D.position
		var simple_CP = Vector2(round(current_pos.x),round(current_pos.y))
		var simple_LP = Vector2(round(last_pos.x),round(last_pos.y))
		if simple_CP != simple_LP:
			$Camera2D.position = current_pos
			last_pos = current_pos
	pass

func _input(event):
	if state == "Show":
		if event is InputEventMouse and event.get_button_mask() == 1:
			hold = true
			if event is InputEventMouseMotion:
				mouse_movement = event.get_relative()
		elif event is InputEventScreenDrag :
			hold = true
			mouse_movement = event.get_relative()
		else:
			hold = false
			#mouse_movement = $Camera2D.position
			#$Camera2D.translate(event.position)
