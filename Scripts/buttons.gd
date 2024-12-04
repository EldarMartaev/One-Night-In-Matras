extends Node

@onready var animation_player_1: AnimationPlayer = $rightButton/AnimationPlayer1
@onready var animation_player_2: AnimationPlayer = $leftButton/AnimationPlayer2
@onready var animation_player_3: AnimationPlayer = $Ventilation/AnimationPlayer3
@onready var animation_player_4: AnimationPlayer = $Lamps/AnimationPlayer4

func _on_button_1_toggled(toggled_on: bool) -> void:
	if toggled_on:
		animation_player_1.play("Close")
	else:
		animation_player_1.play("Open")

func _on_button_2_toggled(toggled_on: bool) -> void:
	if toggled_on:
		animation_player_2.play("leftClose")
	else:
		animation_player_2.play("leftOpen")

func _on_button_3_toggled(toggled_on: bool) -> void:
	if toggled_on:
		animation_player_3.play("Close")
	else:
		animation_player_3.play("Open")

func _on_button_4_toggled(toggled_on: bool) -> void:
	if toggled_on:
		animation_player_4.play("Switch On")
	else:
		animation_player_4.play("Switch Off")
