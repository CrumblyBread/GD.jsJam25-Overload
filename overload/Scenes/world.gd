extends Node2D

@onready var PowerPlantsMenu = $CanvasLayer/PowerPlants
@onready var CityMenu = $CanvasLayer/City

var cityGrid : Array

var timeOfDay

func _ready() -> void:
	populate_grid()

func _on_city_button_button_down() -> void:
	CityMenu.show()
	PowerPlantsMenu.hide()

func _on_power_plants_button_button_down() -> void:
	CityMenu.hide()
	PowerPlantsMenu.show()

func populate_grid():
	cityGrid.resize(20*8)
	var s = ""
	for j in range(7):
		for i in range(19):
			if i == 0 or j == 0 or i == 19 or j == 7 or ((i == 10 or i == 9) and (j == 3 or j == 4)):
				if (i == 10 or i == 9) and (j == 3 or j == 4):
					cityGrid[(j*20)+i] = District.new(i,j,0)
				else:
					cityGrid[(j*20)+i] = District.new(i,j,4)
			else:
				cityGrid[(j*20)+i] = District.new(i,j,-1)
			
			s+= str(cityGrid[(j*20)+i].type)
			s+= ", "
		s += "\n"
	print(s)

class District:

	@export var pos_x : int = -1
	@export var pos_y : int = -1
	@export var type : int = -1
	@export var powerDraw : int = -1

	func _init(_pos_x, _pos_y, _type) -> void:
		pos_x = _pos_x
		pos_y = _pos_y
		
		if _type == -1:
			type = floor(min(19, (randi() % 20) + roundf(0.1*(abs(pos_x - 4) + abs(pos_y - 10)))) / 4)
		else: type = _type
