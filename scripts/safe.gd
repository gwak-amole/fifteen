extends CanvasLayer

@export var input_code: Panel
@export var line_edit: LineEdit
@export var unlocked_safe: Control
@export var locked_safe: Control
@export var shipment_button: TextureButton
@export var shipment_paper: TextureRect
@export var opening_audio: AudioStreamPlayer
@export var beep: AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueHandler.connect("taking_shipment", hide_shipment)
	input_code.hide();
	shipment_paper.hide();
	unlocked_safe.hide();
	locked_safe.show();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	input_code.show();


func _on_code_go_pressed() -> void:
	beep.play()
	if line_edit.text == "9872":
		opening_audio.play()
		print("yay")
		unlocked_safe.show()
		locked_safe.hide()
	else:
		line_edit.text = ""
		line_edit.placeholder_text = "XXXX"

func hide_shipment():
	shipment_button.hide()


func _on_shipment_pressed() -> void:
	shipment_paper.show()
	var resource = load("res://dialogues/safe_interaction.dialogue")
	DialogueManager.show_dialogue_balloon(resource, "shipment")
	await DialogueManager.dialogue_ended;
	shipment_button.hide();
	shipment_paper.hide()


func _on_watch_pressed() -> void:
	var resource = load("res://dialogues/safe_interaction.dialogue")
	DialogueManager.show_dialogue_balloon(resource, "watch")


func _on_goldbars_pressed() -> void:
	var resource = load("res://dialogues/safe_interaction.dialogue")
	DialogueManager.show_dialogue_balloon(resource, "gold_bars")


func _on_done_pressed() -> void:
	hide();
