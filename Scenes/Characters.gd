extends ScrollContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var characters = [{"name":"Thomas Lancer"},{"name":"Jebidiah 'Jeb'"}]
var LSSB = preload("res://Scenes/Elements/LargeSquareSelectButton.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	list_characters()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var parent_width = get_parent().rect_size.x 
	var current_width = $VBoxContainer.rect_size.x 
	if parent_width != current_width :
		$VBoxContainer.rect_min_size.x = parent_width
#	pass

func list_characters():
	var index = 0
	for character in characters:
		var chr = LSSB.instance()
		chr.title = character["name"]
		chr.name = "item"+str(index)
		chr.icon = "res://Imgs/Theme/scalable/status/avatar-default-symbolic.svg"
		chr.connect("clicked",self,"on_clicked")
		$VBoxContainer/HBoxContainer/GridContainer.add_child(chr)
		index += 1
		
func on_clicked(opts):
	#print(opts)
	get_parent().get_parent().character_select(opts)
