extends Node2D

var mainMenuPrefab = preload("res://Scenes/MainMenu.tscn")
var worldPrefab = preload("res://Scenes/world.tscn")

var global
var mainMenu
var world

func _ready() -> void:
	if Global.global == null:
		Global.global = self
	else:
		self.queue_free()
		return
	
	Global.mainMenu = mainMenuPrefab.instantiate()
	add_child(Global.mainMenu)
	Global.mainMenu.play_button_pressed.connect(PlayButtonPressed)

func PlayButtonPressed():
	Global.world = worldPrefab.instantiate()
	add_child(Global.world)
	Global.mainMenu.queue_free()
