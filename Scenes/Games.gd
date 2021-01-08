extends ScrollContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/GameInfoBlock.connect("select_game",self,"_on_game_select")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var parent_width = get_parent().rect_size.x 
	var current_width = $VBoxContainer.rect_size.x 
	if parent_width != current_width + 10:
		$VBoxContainer.rect_min_size.x = parent_width - 10
#	pass

func _on_game_select(data):
	Globals.emit_signal("game_select",data)
	pass
