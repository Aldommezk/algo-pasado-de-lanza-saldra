extends Node3D

@export var mouse_sensitivity: float = 0.0005 # Puedes ajustar este valor aún más si es necesario
@export var max_look_left: float = -45.0 # Límite horizontal hacia la izquierda
@export var max_look_right: float = 45.0 # Límite horizontal hacia la derecha

var mouse_x_rotation: float = 0.0 # Acumulador de rotación horizontal (eje Y)


func _input(event):
	if event is InputEventMouseMotion:
		
		mouse_x_rotation += -event.relative.x * mouse_sensitivity 

		# Limita la rotación horizontal
		mouse_x_rotation = clamp(mouse_x_rotation, deg_to_rad(max_look_left), deg_to_rad(max_look_right))

		# Aplica la rotación al pivote (horizontal)
		self.rotation.y = mouse_x_rotation 
		
		# Asegura que no haya inclinación en Z para el pivote y la cámara
		self.rotation.z = 0
		$CamaraOficina.rotation.z = 0
