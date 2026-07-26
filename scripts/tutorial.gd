extends Control
var resource = load("res://dialogues/tutorial.dialogue")
var ended = false
@export var audio: AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio.play()
	ended = false
	DialogueManager.show_dialogue_balloon(resource, "start")
	await DialogueManager.dialogue_ended
	DialogueHandler.reset()
	if get_tree():
		get_tree().change_scene_to_file("res://scenes/main.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("k"):
		if !ended:
			DialogueHandler.reset()
			DialogueManager.show_dialogue_balloon(resource, "end_this")
			get_tree().change_scene_to_file("res://scenes/main.tscn")
			ended = true
