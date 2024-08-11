@tool
class_name WordButton extends Button

@export var btn_sound : AudioStream
@export var btn_icon : Texture2D:
	set(value):
		btn_icon = value
		icon = btn_icon
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _ready() -> void:
	audio_stream_player.stream = btn_sound


func _on_pressed() -> void:
	audio_stream_player.play()
