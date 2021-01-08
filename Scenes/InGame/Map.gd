extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var state = "Hide"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_state(change):
	state = change
	if state == "Show":
		$ViewportContainer/Viewport/MapView.state = "Show"
	else:
		$ViewportContainer/Viewport/MapView.state = "Hide"


func _on_AnimationPlayer_animation_finished(anim_name):
	set_state(anim_name)
