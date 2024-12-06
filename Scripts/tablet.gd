extends TextureButton

@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var texture_button: TextureButton = $"."

var isDown = true 

func _ready() -> void:
	animation_player.play("Down")
	
