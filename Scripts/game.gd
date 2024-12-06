extends Node2D

@onready var main_timer: Timer = $Timers/MainTimer
@onready var timer: Timer = $Timers/Timer
@onready var battery_cells: Array = [$CanvasLayer/tablet/indecators/PowerBattery/Cell1, $CanvasLayer/tablet/indecators/PowerBattery/Cell2, $CanvasLayer/tablet/indecators/PowerBattery/Cell3, $CanvasLayer/tablet/indecators/PowerBattery/Cell4, $CanvasLayer/tablet/indecators/PowerBattery/Cell5]
@onready var stress_cells: Array = [$CanvasLayer/tablet/indecators/StressBattery/Cell1, $CanvasLayer/tablet/indecators/StressBattery/Cell2, $CanvasLayer/tablet/indecators/StressBattery/Cell3, $CanvasLayer/tablet/indecators/StressBattery/Cell4, $CanvasLayer/tablet/indecators/StressBattery/Cell5]
@onready var first_number: Sprite2D = $CanvasLayer/tablet/Time/firstNumber
@onready var second_number: Sprite2D = $CanvasLayer/tablet/Time/secondNumber
@onready var am_pm: Sprite2D = $CanvasLayer/tablet/Time/AmPm
@onready var first: Sprite2D = $CanvasLayer/tablet/Temp/first
@onready var second: Sprite2D = $CanvasLayer/tablet/Temp/second
@onready var lightning: PointLight2D = $Light
@onready var camera_3: Sprite2D = $CanvasLayer/tablet/tablet/Camera3
@onready var camera_6: Sprite2D = $CanvasLayer/tablet/tablet/Camera6
@onready var music: AudioStreamPlayer2D = $music


var energy = 100
var energyWaste = 0.06
var stress = 0
var stressAdding = 2
var isRightDoorOpen = false
var rightDoor = 0
var isLeftDoorOpen = false
var leftDoor = 0
var isLight = true
var light = 1
var isVentilation = false
var ventilation = 0
var time = 0
var temp = 1
var temperature = 20

func _ready() -> void:
	music.play()
	timer.start()
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	main_timer.start()
	main_timer.connect("timeout", Callable(self, "timeProcess"))
func _process(delta: float) -> void:
	if not music.playing:
		music.play()

func timeProcess() -> void:
	if time == 0:
		am_pm.frame += 1
		first_number.visible = false
		second_number.frame = 1
	else:
		second_number.frame += 1
	time += 1

func _on_timer_timeout() -> void:
	if isLight:
		light = 2
	if isRightDoorOpen:
		rightDoor = 2
	if isLeftDoorOpen:
		leftDoor = 2
	if isVentilation:
		ventilation = 2
		if temperature <= 25:
			pass
		elif temperature <= 35:
			temp = 1.5
		elif temperature <= 45:
			temp = 2
		elif temperature <= 55:
			temp = 2.5
		temperature += 0.5
	else:
		if temperature > 20:
			temp = 0
			temperature -= 0.5
	update_temp()
	energy -= energyWaste * (light + rightDoor + leftDoor + ventilation)
	energy = clamp(energy, 0, 100)
	light = 1
	rightDoor = 0
	leftDoor = 0
	ventilation = 0
	update_battery_cells()
	
	if isLight == false or isVentilation:
		stress += stressAdding * temp
		stress = clamp(stress, 0, 100)
	else:
		if stress > 0:
			stress -= stressAdding * 2
	update_stress_cells()
	
	if energy <= 0 or stress >= 100:
		screamer()
	if time == 6:
		victory()

func _on_button_1_toggled(toggled_on: bool) -> void:
	if toggled_on:
		isRightDoorOpen = true
		camera_6.frame = 0
	else:
		isRightDoorOpen = false
		if isLight:
			camera_6.frame = 1
		else:
			camera_6.frame = 0

func _on_button_2_toggled(toggled_on: bool) -> void:
	if toggled_on:
		isLeftDoorOpen = true
		camera_3.frame = 2
	else:
		isLeftDoorOpen = false
		if isLight:
			camera_3.frame = 0
		else:
			camera_3.frame = 1

func _on_button_3_toggled(toggled_on: bool) -> void:
	if toggled_on:
		isVentilation = true
	else:
		isVentilation = false

func _on_button_4_toggled(toggled_on: bool) -> void:
	if toggled_on:
		isLight = false
		camera_3.frame = 1
		camera_6.frame = 0
	else:
		isLight = true
		camera_3.frame = 0
		camera_6.frame = 1

func update_temp() -> void:
	first.frame = int(temperature/10)
	second.frame = temperature - (int(temperature/10) * 10)
	
func update_battery_cells() -> void:
	var active_cells = int(energy / 20) + 1
	for i in range(5):
		battery_cells[i].visible = i < active_cells

func update_stress_cells() -> void:
	var active_cells = int(stress / 20)
	for i in range(5):
		stress_cells[i].visible = i < active_cells

func victory() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
	print("Victory!!!")
func screamer() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
	print("Screamer!!!!!!!!!!")
