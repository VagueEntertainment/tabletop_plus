extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var state = "Hide"
signal popup(opts)
# Called when the node enters the scene tree for the first time.
func _ready():
	for child in $ScrollContainer/VBoxContainer/HBoxContainer/GridContainer.get_children():
		child.connect("clicked",self,"_on_clicked")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	state = anim_name
	pass # Replace with function body.


func _on_clicked(opts):
	emit_signal("popup",[name,opts])
	pass # Replace with function body.
