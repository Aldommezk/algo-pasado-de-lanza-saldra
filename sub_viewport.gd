extends SubViewport

func _ready():
	# Obtiene una referencia al Viewport raíz (la ventana del juego principal)
	var root_viewport = get_tree().get_root()

	# Asigna el tamaño del Viewport raíz al SubViewport
	self.size = root_viewport.size
