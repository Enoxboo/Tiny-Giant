extends Node2D

@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer

func _ready():
	AudioManager.audio_player = audio_stream_player
