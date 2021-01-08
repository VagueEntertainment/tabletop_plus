extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var toggled = false
export var border_color = Color(1,1,1,1)
export var fill_color = Color(1,1,1,1)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Toggle.self_modulate = fill_color
	self_modulate = border_color
	set_toggle()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CircleIndicator_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		if toggled:
			toggled = false
			set_toggle()
		else:
			toggled = true
			set_toggle()
			
	pass # Replace with function body.

func set_toggle():
	if toggled:
		$Toggle.show()
	else:
		$Toggle.hide()
