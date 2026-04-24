#game_manager.gd
extends Node
var score := 0
@onready var animation_player: AnimationPlayer = $CanvasLayer/AnimationPlayer

func add_point():
	score+=1

func fade_in():
	animation_player.play("fadeIn")
	
func fade_out():
	animation_player.play_backwards("fadeIn")
	
