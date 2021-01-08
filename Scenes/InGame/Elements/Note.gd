extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var title = ""
export var note = ""
export var date = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	if title == "":
		title = name
	
	$NotePreview/VBoxContainer/Title.text = title
	$NotePreview/VBoxContainer/Note.text = note
	$NotePreview/VBoxContainer/Updated/Date.text = date
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
