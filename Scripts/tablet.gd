extends TextureButton

@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var texture_button: TextureButton = $"."

var isDown = true 

func _ready() -> void:
	animation_player.play("Down")
	
func _on_toggled(toggled_on: bool) -> void:
	if isDown == true:
		animation_player.play("Up")
		isDown = false
	else:
		animation_player.play("Down")
		isDown = true
