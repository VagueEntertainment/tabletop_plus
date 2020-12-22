extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal clicked(opts)

export var title = ""
export var icon = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	var texture = load(icon)
	$Label.text = title
	$PanelContainer/TextureRect.texture = texture
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LSSB_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		emit_signal("clicked",[name,title])
		
	pass # Replace with function body.
