extends Node

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var score := 0

func play_coin_sound():
	# .duplicate() permite que el sonido se solape si recoges 
	# muchas monedas rápido sin que se corte el anterior
	var new_player = audio_stream_player.duplicate()
	add_child(new_player)
	new_player.play()
	new_player.pitch_scale = randf_range(.8, 1.2)
	# Se destruye automáticamente al terminar para no llenar la memoria
	new_player.finished.connect(new_player.queue_free)
	
func add_point():
	score+=1
	print(score)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
