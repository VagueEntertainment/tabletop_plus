extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var HomeView = preload("res://Scenes/Home.tscn")
var Characters = preload("res://Scenes/Characters.tscn")
var Games = preload("res://Scenes/Games.tscn")
var GameSelect = preload("res://Scenes/GameSelect.tscn")
var Character = preload("res://Scenes/Character.tscn")
var InGame = preload("res://Scenes/InGame.tscn")

onready var HomeViewInstance = HomeView.instance()
onready var CharactersInstance = Characters.instance()
onready var CharacterInstance = Character.instance()
onready var GamesInstance = Games.instance()
onready var GameSelectInstance = GameSelect.instance()
onready var InGameInstance = InGame.instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	$MainArea.add_child(HomeViewInstance)
	$MainArea.add_child(CharactersInstance)
	$MainArea.add_child(GamesInstance)
	$MainArea.add_child(GameSelectInstance)
	$MainArea.add_child(CharacterInstance)
	$MainArea.add_child(InGameInstance)
	Globals.connect("nav_update",self,"_on_nav_update")
	Globals.connect("game_select",self,"game_select")
	Globals.connect("game_start",self,"game_start")
	change_scene("Home")
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
	InGameInstance.hide()

func change_scene(scene):
	clear_everything()
	match scene:
		"Characters":
			_on_nav_update(["characters","Characters"])
			CharactersInstance.show()
		"Games":
			_on_nav_update(["games","Games"])
			GamesInstance.show()
		"Achievements":
			_on_nav_update(["achievements","Achievements"])
			print("Achievements")
		"Friends":
			_on_nav_update(["friends","Friends"])
			print("Friends")
		"Home":
			_on_nav_update(["home","Home"])
			HomeViewInstance.show()
		"InGame":
			_on_nav_update(["ingame","In Game"])
			InGameInstance.show()

func game_select(gamename):
	print(gamename)
	#print("Game Select")
	clear_everything()
	GameSelectInstance.show()

func game_start(gamename):
	change_scene("InGame")

func character_select(opts):
	#print("Character Select")
	clear_everything()
	CharacterInstance.load_character(opts)
	CharacterInstance.show()

func _on_NavButton1_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		change_scene("Home")
	pass # Replace with function body.

func _on_nav_update(data):
	#print("From Nav Update")
	$TopBar/Title.text = data[1]
	
	pass
