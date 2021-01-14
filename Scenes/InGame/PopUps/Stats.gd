extends PanelContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var parent_width = get_parent().rect_size.x 
	var current_width = self.rect_size.x 

	if parent_width != current_width + 10 :
		current_width = parent_width - 10
		self.rect_min_size.x = current_width
		self.rect_size.x = current_width
	pass


func _on_Cancel_pressed():
	hide()
	pass # Replace with function body.
