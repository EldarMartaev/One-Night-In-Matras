extends Sprite2D

@onready var camera3: Array = [$Camera3/miras1, $Camera3/miras2, 0, 0]
@onready var camera4: Array = [$Camera4/miras2]
@onready var camera5: Array = [$Camera5/miras2]
@onready var camera6: Array = [$Camera6/miras3]
@onready var camera7: Array = [$Camera7/miras3]
@onready var camera8: Array = [$Camera8/miras3, 0]

@onready var timer_1: Timer = $Timers/Timer1
@onready var timer_2: Timer = $Timers/Timer2
@onready var timer_3: Timer = $Timers/Timer3

@onready var onim: Node2D = $"../../.."

var isLeftDoorClose = false
var isRightDoorClose = false
var isVentilationClose = false
var isLight = true

@onready var mias_1: Sprite2D = $"../../../mias1"
@onready var mias_2: Sprite2D = $"../../../mias2"
@onready var mias_3: Sprite2D = $"../../../mias3"

func _ready() -> void:
	timer_1.start()
	timer_2.start()
	timer_3.start()
	timer_1.connect("timeout", Callable(self, "time1"))
	timer_2.connect("timeout", Callable(self, "time2"))
	timer_3.connect("timeout", Callable(self, "time3"))
	
func time1() -> void:
	if camera3[2] < 2:
		camera3[2] += 1
	elif camera3[2] == 2:
		camera3[0].visible = true
		camera3[2] += 1
	elif camera3[2] == 3:
		camera3[0].frame += 1
		camera3[2] += 1
	elif camera3[2] == 4:
		camera3[0].visible = false
		mias_1.visible = true
		camera3[2] += 1
	elif camera3[2] > 4:
		if isLeftDoorClose:
			camera3[2] = 1
			mias_1.visible = false
			camera3[0].frame = 0
		else:
			onim.screamer()
func time2() -> void:
	if camera3[3] < 2:
		camera3[3] += 1
	elif camera3[3] == 2:
		camera3[1].visible = true
		camera3[3] += 1
	elif camera3[3] == 3:
		camera3[1].visible = false
		camera4[0].visible = true
		camera3[3] += 1
	elif camera3[3] == 4:
		camera4[0].frame = 1
		camera3[3] += 1
	elif camera3[3] == 5:
		camera4[0].visible = false
		camera5[0].visible = true
		camera3[3] += 1
	elif camera3[3] == 6:
		camera5[0].visible = false
		mias_2.visible = true
		camera3[3] += 1
	elif camera3[3] > 6:
		if isVentilationClose:
			camera3[3] = 1
			mias_2.visible = false
			camera3[1].frame = 0
		else:
			onim.screamer()
func time3() -> void:
	if camera8[1] == 0:
		camera8[0].frame -= 1
		camera8[1] += 1
	elif camera8[1] == 1:
		camera8[0].visible = false
		camera7[0].visible = true
		camera8[1] += 1
	elif camera8[1] == 2:
		camera7[0].frame += 1
		camera8[1] += 1
	elif camera8[1] == 3:
		camera7[0].visible = false
		camera6[0].visible = true
		camera8[1] += 1
	elif camera8[1] == 4:
		camera6[0].frame += 1
		camera8[1] += 1
	elif camera8[1] == 5:
		camera6[0].visible = false
		mias_3.visible = true
		camera8[1] += 1
	elif camera8[1] > 5:
		if isRightDoorClose:
			camera8[1] = 0
			mias_3.visible = false
			camera8[0].frame = 1
		else:
			onim.screamer()
func _on_button_1_toggled(toggled_on: bool) -> void:
	if toggled_on:
		isRightDoorClose = true
	else:
		isRightDoorClose = false
	
func _on_button_2_toggled(toggled_on: bool) -> void:
	if toggled_on:
		isLeftDoorClose = true
	else:
		isLeftDoorClose = false

func _on_button_3_toggled(toggled_on: bool) -> void:
	if toggled_on:
		isVentilationClose = true
	else:
		isVentilationClose = false

func _on_button_4_toggled(toggled_on: bool) -> void:
	if toggled_on:
		isLight = false
	else:
		isLight = true
