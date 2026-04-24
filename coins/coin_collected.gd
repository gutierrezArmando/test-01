extends Area3D
@export var rotation_speed: float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_y(rotation_speed)


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		SoundManager.play_coin_sound()
		GameManager.add_point()
		queue_free()
"""	
	if body is Player:
		print("Colisión por nombre de clase")
		print("Colisión por capas")
"""
