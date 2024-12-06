extends Node

@onready var animation_player_1: AnimationPlayer = $rightButton/AnimationPlayer1
@onready var animation_player_2: AnimationPlayer = $leftButton/AnimationPlayer2
@onready var animation_player_3: AnimationPlayer = $Ventilation/AnimationPlayer3
@onready var animation_player_4: AnimationPlayer = $Lamps/AnimationPlayer4
@onready var canvas_modulate: CanvasModulate = $"../CanvasModulate"
@onready var light: PointLight2D = $"../Light"
@onready var audio_player: AudioStreamPlayer2D = $MiasButton/AudioStreamPlayer2D
@onready var audio_player2: AudioStreamPlayer2D = $phoneButton/AudioStreamPlayer2D
@onready var opening: AudioStreamPlayer2D = $Opening
@onready var closing: AudioStreamPlayer2D = $Closing
@onready var light_switch: AudioStreamPlayer2D = $Lamps/lightSwitch


func _on_ready() -> void:
	animation_player_4.play("Switch On")

func _on_button_1_toggled(toggled_on: bool) -> void:
	if toggled_on:
		animation_player_1.play("Close")
		closing.play()
	else:
		animation_player_1.play("Open")
		opening.play()

func _on_button_2_toggled(toggled_on: bool) -> void:
	if toggled_on:
		animation_player_2.play("leftClose")
		closing.play()
	else:
		animation_player_2.play("leftOpen")
		opening.play()

func _on_button_3_toggled(toggled_on: bool) -> void:
	if toggled_on:
		animation_player_3.play("Close")
		closing.play()
	else:
		animation_player_3.play("Open")
		opening.play()

func _on_button_4_toggled(toggled_on: bool) -> void:
	light_switch.play()
	if toggled_on:
		animation_player_4.play("Switch Off")
		canvas_modulate.visible = true
		light.visible = true
	else:
		animation_player_4.play("Switch On")
		canvas_modulate.visible = false
		light.visible = false
		
func _on_texture_button_button_down() -> void:
	audio_player.play()

func _on_phone_button_down() -> void:
	audio_player2.play()
