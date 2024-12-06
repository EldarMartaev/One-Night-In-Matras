extends Sprite2D

var activeCamera = 0
var notWorkingCam: Array = [1, 2]
var isDown = true
@onready var camerasList: Array = [$"../tablet/NoSignal", $"../tablet/Camera3", $"../tablet/Camera4", $"../tablet/Camera5", $"../tablet/Camera6", $"../tablet/Camera7", $"../tablet/Camera8"]
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var button_sound: AudioStreamPlayer2D = $buttonSound

func process_cameras(n: int) -> void:
	button_sound.play()
	if not n in notWorkingCam:
		if activeCamera == 0:
			camerasList[n - 2].visible = true
			activeCamera = n
		else:
			camerasList[activeCamera - 2].visible = false
			camerasList[n - 2].visible = true
			activeCamera = n
	else:
		if activeCamera == 0:
			camerasList[0].visible = true
			activeCamera = 2
		else:
			camerasList[activeCamera - 2].visible = false
			camerasList[0].visible = true
			activeCamera = 2

func _on_button_1_toggled(toggled_on: bool) -> void:
	process_cameras(1)
func _on_button_2_toggled(toggled_on: bool) -> void:
	process_cameras(2)
func _on_button_3_toggled(toggled_on: bool) -> void:
	process_cameras(3)
func _on_button_4_toggled(toggled_on: bool) -> void:
	process_cameras(4)
func _on_button_5_toggled(toggled_on: bool) -> void:
	process_cameras(5)
func _on_button_6_toggled(toggled_on: bool) -> void:
	process_cameras(6)
func _on_button_7_toggled(toggled_on: bool) -> void:
	process_cameras(7)
func _on_button_8_toggled(toggled_on: bool) -> void:
	process_cameras(8)
func _on_texture_button_toggled(toggled_on: bool) -> void:
	if activeCamera == 0:
		if isDown == true:
			animation_player.play("Up")
			isDown = false
		else:
			animation_player.play("Down")
			isDown = true
	else:
		camerasList[activeCamera - 2].visible = false
		if isDown == true:
			animation_player.play("Up")
			isDown = false
		else:
			animation_player.play("Down")
			isDown = true
