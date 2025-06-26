extends Node2D

@export var smooth_speed: float = 5.0 # Velocidad de suavizado de la cámara
@export var mouse_sensitivity: float = 0.5 # Sensibilidad del movimiento del mouse
var camera_limit: float = 0.0

var target_camera_x_position: float = 0.0 # Posición X objetivo por el mouse
var current_camera_x_position: float = 0.0 # Posición X suavizada actual del pivote

func _ready():
	var root_viewport = get_tree().get_root()
	camera_limit = root_viewport.size.x
	if $CamaraOficina: 
		$CamaraOficina.make_current()
	else:
		printerr("Error: No se encontró el nodo 'CamaraOficina' como hijo del pivote. ¡Revisa el nombre!")

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	current_camera_x_position = lerp(current_camera_x_position, target_camera_x_position, 1.0 - exp(-smooth_speed * delta))
	
	position.x = current_camera_x_position
	position.y = 0.0
	rotation = 0.0

	if Input.is_action_just_pressed("ui_cancel"): 
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _input(event):
	if event is InputEventMouseMotion:
		target_camera_x_position += event.relative.x * mouse_sensitivity 
		target_camera_x_position = clamp(target_camera_x_position, 0, camera_limit)
