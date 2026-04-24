#kill_area.gd
extends Area3D

#conectado desde la sección de señales
func _on_body_entered(body: Node3D) -> void:
	if body is Player and body.has_method("kill"):
		body.kill()
