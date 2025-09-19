extends Node2D

# Audio
@onready var audio1: AudioStreamPlayer = $Clover
@onready var audio2: AudioStreamPlayer = $Clover

# AnimatedSprite2D
@onready var anim1: AnimatedSprite2D = $anime_1
@onready var anim2: AnimatedSprite2D = $anime_2

# Boutons
@onready var button1: Button = $Button1
@onready var button2: Button = $Button2

# Track playback states
var is_playing_1 := false
var is_playing_2 := false

func _ready():
	button1.pressed.connect(_on_button1_pressed)
	button2.pressed.connect(_on_button2_pressed)

func _on_button1_pressed():
	if is_playing_1:
		anim1.stop()
		audio1.stop()
		button1.text = "Play 1"
	else:
		anim1.play("anime_1")
		audio1.play()
		button1.text = "stop"
	is_playing_1 = !is_playing_1
 
 
func _on_button2_pressed():
	if is_playing_2:
		anim2.stop()
		audio2.stop()
		button2.text = "Play 2"
	else:
		anim2.play("anime_1")
		audio2.play()
		button2.text = "stop"
	is_playing_2 = !is_playing_2
	
func _input(play):
	if play.is_action_pressed("play"):
		anim1.play()
		audio1.play()
		button1.text = "stop"
		anim2.play("anime_1")
		audio2.play()
		button2.text = "stop"
