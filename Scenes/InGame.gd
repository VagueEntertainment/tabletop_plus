extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var current_width = $VBox/Nav.rect_size.x / 3
	for button in $VBox/Nav.get_children():
			button.rect_min_size.x = current_width
	
	var vbox = $VBox.rect_size
	var Nav = $VBox/Nav.rect_size
	
	$VBox/Container.rect_min_size.y = vbox.y - Nav.y - 60
	
	
	for child in $VBox/Container.get_children():
		if child.has_signal("popup"):
			child.connect("popup",self,"_on_popup")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	var parent_width = $VBoxContainer/HBoxContainer.rect_size.x
#	var current_width = $VBoxContainer/HBoxContainer.rect_size.x / 3
#	if parent_width != current_width / 3:
		
#	pass
func hide_all(except = ""):
	for child in $VBox/Container.get_children():
		if child.state != "Hide" and child.name != except:
			child.get_node("AnimationPlayer").play("Hide")
	for child in $VBox/Nav.get_children():
		if child.pressed == true and child.name !=except:
			child.pressed = false

func _on_Character_pressed():
	hide_all("Character")
	if $VBox/Container/Character.state != "Show":
		$VBox/Container/Character/AnimationPlayer.play("Show")
	pass # Replace with function body.


func _on_Notes_pressed():
	hide_all("Notes")
	if $VBox/Container/Notes.state != "Show":
		$VBox/Container/Notes/AnimationPlayer.play("Show")
	pass # Replace with function body.


func _on_Map_pressed():
	hide_all("Map")
	if $VBox/Container/Map.state != "Show":
		$VBox/Container/Map/AnimationPlayer.play("Show")
	pass # Replace with function body.


func _on_InGame_visibility_changed():
	if visible:
		_on_Character_pressed()
		pass # Replace with function body.

func _on_popup(opts):
	print(opts[1][0])
	for child in $VBox/Container/PopUps.get_children():
		if child.name == opts[1][0]:
			print("found ",opts[1][0])
			child.get_node("AnimationPlayer").play("Show")
			break
