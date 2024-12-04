extends Node2D

@onready var timer: Timer = $Timers/Timer
@onready var battery_cells: Array = [$tablet/indecators/PowerBattery/Cell1, $tablet/indecators/PowerBattery/Cell2, $tablet/indecators/PowerBattery/Cell3, $tablet/indecators/PowerBattery/Cell4, $tablet/indecators/PowerBattery/Cell5]
@onready var stress_cells: Array = [$tablet/indecators/StressBattery/Cell1, $tablet/indecators/StressBattery/Cell2, $tablet/indecators/StressBattery/Cell3, $tablet/indecators/StressBattery/Cell4, $tablet/indecators/StressBattery/Cell5]
@onready var texture_button: TextureButton = $Lamps/TextureButton

var energy = 100
var energyWaste = 0.06
var stress = 100
var stressAdding = 2
var screamerBool = false

func _ready() -> void:
	timer.start()
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))

func _on_timer_timeout() -> void:
	energy -= energyWaste
	energy = clamp(energy, 0, 100)
	update_battery_cells()
	if screamerBool or energy <= 0:
		screamer()
func update_battery_cells() -> void:
	var active_cells = int(energy / 20) + 1
	for i in range(5):
		battery_cells[i].visible = i < active_cells
		
func screamer() -> void:
	get_tree().change_scene_to_file("res://Scenes/node_2d.tscn")
