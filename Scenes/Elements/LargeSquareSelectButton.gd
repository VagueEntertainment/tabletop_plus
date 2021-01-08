extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal clicked(opts)

export var title = ""

export var icon = ""
export var show_icon = true
export var icon_opacity = 1.0

export var info = ""
export var show_info = false

export var background = true

# Called when the node enters the scene tree for the first time.
func _ready():
	var items = find_items()
	
	if title != "":
		items["Label"].text = title
	else:
		items["Label"].text = name
		
	if icon != "" and show_icon:
		var texture = load(icon)
		items["Image"].texture = texture
		items["Image"].self_modulate = Color(1,1,1,icon_opacity)
	elif !show_icon:
		items["Image"].self_modulate = Color(1,1,1,0)
		
	if info != "" and show_info:
		items["Info"].text = info
		items["Info"].show()
	else:
		items["Info"].text = info
		items["Info"].hide()
	
	if background:
		items["Container"].self_modulate = Color(1,1,1,1)
	else:
		items["Container"].self_modulate = Color(1,1,1,0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LSSB_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == 1:
		if $AnimationPlayer.has_animation("Clicked"):
			$AnimationPlayer.play("Clicked")
		else:
			emit_signal("clicked",[name,title])
	pass # Replace with function body.

func do_the_thing(thing,speed):
	$AnimationPlayer.playback_speed = speed
	$AnimationPlayer.play(thing)

func find_items():
	var label = $Label
	var image = $PanelContainer/TextureRect/
	var info = $PanelContainer/TextureRect/Info
	var container = $TextureRect/PanelContainer
	var all_nodes = []
	
	for child in self.get_children():
		if child.get_child_count() > 0:
			all_nodes.append(child)
			for c1 in child.get_children():
				all_nodes.append(c1)
				if c1.get_child_count() > 0:
					all_nodes.append(get_child(0))
		else:
			all_nodes.append(child)
	
	for node in all_nodes:
		match node.name:
			"Label":
				label = node
			"Info":
				info = node
			"TextureRect":
				image = node
			"PanelContainer":
				container = node
	
	return {"Label":label,"Image":image,"Info":info,"Container":container}


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Clicked":
		emit_signal("clicked",[name,title])
	pass # Replace with function body.
