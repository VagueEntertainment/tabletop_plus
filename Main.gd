extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var HomeView = preload("res://Scenes/Home.tscn")
var Characters = preload("res://Scenes/Characters.tscn")
var Games = preload("res://Scenes/Games.tscn")
var GameSelect = preload("res://Scenes/GameSelect.tscn")
var Character = preload("res://Scenes/Character.tscn")

onready var HomeViewInstance = HomeView.instance()
onready var CharactersInstance = Characters.instance()
onready var CharacterInstance = Character.instance()
onready var GamesInstance = Games.instance()
onready var GameSelectInstance = GameSelect.instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	change_scene("Home")
	$MainArea.add_child(HomeViewInstance)
	$MainArea.add_child(CharactersInstance)
	$MainArea.add_child(GamesInstance)
	$MainArea.add_child(GameSelectInstance)
	$MainArea.add_child(CharacterInstance)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func clear_everything():
	HomeViewInstance.hide()
	CharactersInstance.hide()
	GamesInstance.hide()
	GameSelectInstance.hide()
	CharacterInstance.hide()

func change_scene(scene):
	clear_everything()
	match scene:
		"Characters":
			print("Characters")
			CharactersInstance.show()
		"Games":
			print("Games")
		"Achievements":
			print("Achievements")
		"Friends":
			print("Friends")
		"Home":
			print("Home")
			HomeViewInstance.show()

func game_select(gamename):
	print("Game Select")
	clear_everything()
	GameSelectInstance.show()

func character_select(opts):
	print("Character Select")
	clear_everything()
	CharacterInstance.show()

func _on_NavButton1_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		change_scene("Home")
	pass # Replace with function body.
