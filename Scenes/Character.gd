extends ScrollContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var opts = []

# Called when the node enters the scene tree for the first time.
func _ready():
	#load_character(opts)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func load_character(data):
	var CharacterName = $VBoxContainer/Name
	var HPBar = $VBoxContainer/HPbar/ProgressBar
	var MaxHP = 100
	var HP = 50
	CharacterName.text = data[1]
	Globals.emit_signal("nav_update",["character_select","Stats"])
	
