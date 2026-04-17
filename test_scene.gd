extends Node3D
@onready var label_3d: Label3D = $Label3D
var numero: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	numero = 0;
	actualizar_contador()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(numero)

func actualizar_contador():
	#print("El valor es: " + str(numero))
	while true:
		await get_tree().create_timer(1.0).timeout
		label_3d.text = str(numero)
		numero+=1
