extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var title = ""
export var icon = ""
export var data1_label = ""
export var data2_label = ""
export var data1 = ""
export var data2 = ""
export var mode = "normal"

var modes = [
	{"name":"normal","color":"#61b8e9"},
	{"name":"alert","color":"#ffa0a0"},
	{"name":"caution","color":"#eacb5e"},
	{"name":"success","color":"#80cd88"},
	{"name":"disabled","color":"#d7d7d7"}
]

# Called when the node enters the scene tree for the first time.
func _ready():
	set_mode(mode)
	if title == "":
		$Panel/HBox/Info/Name.text = name
	else:
		$Panel/HBox/Info/Name.text = title
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var parent_width = get_parent().rect_size.x 
	var current_width = self.rect_size.x 
	if parent_width != current_width :
		self.rect_min_size.x = parent_width
		$Panel.rect_min_size.x = parent_width * 0.8
	pass

func set_mode(mode):
	for m in modes:
		if m["name"] == mode:
			$Panel.self_modulate = m["color"]
			if m["name"] == "disabled":
				$Panel.modulate = Color(0.5,0.5,0.5,0.8)
			break
	pass
