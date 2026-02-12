extends Node

var audio_player: AudioStreamPlayer2D

const SCALE_DOWN = preload("uid://c37ri3rnbw26e")
const SCALE_UP = preload("uid://cgms2tqrlc5qp")

func play_scale_sound(scale_up: bool):
	if audio_player:
		audio_player.stream = SCALE_UP if scale_up else SCALE_DOWN
		audio_player.play()
