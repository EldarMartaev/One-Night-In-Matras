extends PointLight2D

func _process(delta: float) -> void:
	self.position = self.get_global_mouse_position()
