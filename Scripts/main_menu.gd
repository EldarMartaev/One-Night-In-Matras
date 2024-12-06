extends Node2D

@onready var music: AudioStreamPlayer2D = $music

func _on_play_button_button_down() -> void:
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")

func _on_ready() -> void:
	music.play()
	
func _process(delta: float) -> void:
	if not music.playing:
		music.play()
