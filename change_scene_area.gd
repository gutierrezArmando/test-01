#change_scene_area.gd
extends Area3D

@export var nextScene := ""

#conectada desde la sección de señales del inspector
func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		GameManager.fade_out()
		body.hide()
		await GameManager.animation_player.animation_finished
		get_tree().call_deferred("change_scene_to_file", nextScene)
