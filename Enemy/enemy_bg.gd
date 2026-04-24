#enemy_bg.gd
extends Area3D

#conectado desde la lista de señales
func _on_body_entered(body: Node3D) -> void:
	if body is Player and body.has_method("kill"):
		GameManager.score = 0
		body.kill()
