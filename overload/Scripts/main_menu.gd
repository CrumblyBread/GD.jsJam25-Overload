extends Node2D

@onready var mainMenu = $CanvasLayer/Panel/MainMenu
@onready var creditsMenu = $CanvasLayer/Panel/CreditsMenu
@onready var optionsMenu = $CanvasLayer/Panel/OptionsMenu
@onready var AskBox = $CanvasLayer/Panel/AskBox

signal play_button_pressed
var playEmited = false

func _on_quit_button_down() -> void:
	AskBox.show()
	mainMenu.hide()

func _on_no_button_button_down() -> void:
	AskBox.hide()
	mainMenu.show()

func _on_yes_button_button_down() -> void:
	get_tree().quit()

func _on_credits_button_down() -> void:
	mainMenu.hide()
	creditsMenu.show()

func _on_credits_back_button_down() -> void:
	mainMenu.show()
	creditsMenu.hide()

func _on_options_button_down() -> void:
	optionsMenu.show()
	mainMenu.hide()
	
func _on_options_back_button_down() -> void:
	optionsMenu.hide()
	mainMenu.show()

func _on_play_button_button_down() -> void:
	if playEmited: return
	play_button_pressed.emit()
	playEmited = true
