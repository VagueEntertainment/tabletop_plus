extends ScrollContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#$VBoxContainer/Control.rect_min_size.y = round(get_parent().rect_size.y / 10)
	#$VBoxContainer/Control2.rect_min_size.y = round(get_parent().rect_size.y / 10)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var parent_width = get_parent().rect_size.x 
	var current_width = $VBoxContainer.rect_size.x 
	
	if parent_width != current_width:
		$VBoxContainer.rect_min_size.x = parent_width
		$VBoxContainer/Control.rect_min_size.y = round(get_parent().rect_size.y / 30)
		$VBoxContainer/Control2.rect_min_size.y = round(get_parent().rect_size.y / 20)
	
	pass

func _on_Characters_clicked(_opts):
	get_parent().get_parent().change_scene("Characters")
	pass # Replace with function body.


func _on_Games_clicked(_opts):
	get_parent().get_parent().change_scene("Games")
	pass # Replace with function body.


func _on_Achievements_clicked(_opts):
	get_parent().get_parent().change_scene("Achievements")
	pass # Replace with function body.


func _on_Friends_clicked(_opts):
	get_parent().get_parent().change_scene("Friends")
	pass # Replace with function body.


func _on_GameInfoBlock_select_game(gamename):
	get_parent().get_parent().game_select("test")
	pass # Replace with function body.



func _on_Home_visibility_changed():
	if visible:
		for child in $VBoxContainer/HBoxContainer/GridContainer.get_children():
			print("doing the thing on ",child.name)
			child.do_the_thing("idle",2)
	pass # Replace with function body.
