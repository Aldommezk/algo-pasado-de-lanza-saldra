# Camera1D.gd
extends Camera2D

@export var smooth_speed: float = 5.0  # Velocidad de suavizado de la cámara

func _ready():
	make_current()

func _process(delta):
	# Obtener la posición global del cursor
	var mouse_position = get_viewport().get_mouse_position()
	global_position = global_position.lerp(Vector2(mouse_position.x, 0), smooth_speed * delta)
