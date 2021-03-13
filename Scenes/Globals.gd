extends Node

# TODO: Add code to show splash screen for slow-loading windows.

signal nav_update(data)
signal game_select(gamename)
signal game_start(gamename)
signal loading(action)

# Called when the node enters the scene tree for the first time.
func _ready():
	loading()

func loading():
	emit_signal("loading", "start")
	$Timer.start()

func _on_Timer_timeout():
	emit_signal("loading", "finish")
	$Timer.stop()
