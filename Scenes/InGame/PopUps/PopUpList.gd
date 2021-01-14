extends PanelContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var state = "Hide"

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBox/Title.text = name
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var parent_width = get_parent().rect_size.x 
	var current_width = self.rect_size.x 

	if parent_width != current_width + 10 :
		current_width = parent_width - 10
		self.rect_min_size.x = current_width
		self.rect_size.x = current_width
		$VBox/Title/search/SearchEntry.rect_min_size.x = current_width - 60
	pass


func _on_SearchButton_pressed():
	if $VBox/Title/search/SearchEntry.visible:
		$VBox/Title/search/SearchEntry.hide()
	else:
		$VBox/Title/search/SearchEntry.show()
		
	pass # Replace with function body.


func _on_SearchEntry_text_changed(new_text):
	search_list(new_text)
	pass # Replace with function body.

func search_list(text):
	print(text)


func _on_Cancel_pressed():
	$AnimationPlayer.play_backwards("Show")
	pass # Replace with function body.
