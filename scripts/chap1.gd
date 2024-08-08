extends CanvasLayer

@onready var grid_container: GridContainer = $fundo/MarginContainer/fundo2/MarginContainer/VBoxContainer/GridContainer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var audio_result: AudioStreamPlayer = $AudioResult
@onready var result_icon_correct: TextureRect = $fundo/MarginContainer/fundo2/ResultIconCorrect
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var bottom_container: HBoxContainer = %BottomContainer



const CORRECT_SOUND_EFFECT = preload("res://asset/sounds/Correct sound effect.mp3")
const WRONG_SOUND_EFFECT__MP_3_CUT_NET_ = preload("res://asset/sounds/wrong sound effect (mp3cut.net).mp3")

var word_list =[]
var audio_stream_file : AudioStream

func _ready() -> void:
	randomize()
	for b in grid_container.get_children():
		word_list.append(b.btn_sound)
		b.pressed.connect(on_iconbtn_pressed.bind(b))
		b.disabled = true
	word_list.shuffle()
	audio_stream_file = word_list[0]
	audio_stream_player.stream = audio_stream_file
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_iconbtn_pressed(b):
####### CORRECT ANSWER##############
	
	if b.btn_sound == audio_stream_file: 
		audio_result.stream = CORRECT_SOUND_EFFECT
		await get_tree().create_timer(1.0). timeout
		animation_player.play("correct")
		audio_result.play()
		show_bottom_container()
		Global.chapter_nbr += 1
		
####INCORRECT ANSWER ###############
	else:
		audio_result.stream = WRONG_SOUND_EFFECT__MP_3_CUT_NET_
		await get_tree().create_timer(1.0). timeout
		animation_player.play("incorrect")
		audio_result.play()
	
func _on_btn_word_to_find_pressed() -> void:
	for b in grid_container.get_children():
		b.disabled = false
	audio_stream_player.play()

func show_bottom_container():
	bottom_container.show()
	if name != "chapter1":
		%BtnPrevious.show()
	else:
		%BtnPrevious.hide()
	

func _on_btn_previous_pressed() -> void:
	Global.chapter_nbr -= 2
	var scene_path = "res://chap" + str(Global.chapter_nbr) + ".tscn"
	if ResourceLoader.exists(scene_path):
		get_tree().change_scene_to_file("res://chap" + str(Global.chapter_nbr) + ".tscn")


func _on_btn_next_pressed() -> void:
	var scene_path = "res://chap" + str(Global.chapter_nbr) + ".tscn"
	if ResourceLoader.exists(scene_path):
		get_tree().change_scene_to_file("res://chap" + str(Global.chapter_nbr) + ".tscn")
