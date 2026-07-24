extends Node

@export var lamp_canvas: CanvasLayer
@export var done_button: Button
@export var sticky: TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lamp_canvas.hide()
	sticky.hide()
	DialogueHandler.connect("checking_lamp", open_lamp)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func open_lamp():
	lamp_canvas.show();

func _on_sticky_note_pressed() -> void:
	var resource = load("res://dialogues/lamp_interaction.dialogue")
	done_button.hide()
	DialogueManager.show_dialogue_balloon(resource, "sticky_check")
	sticky.show()
	await DialogueManager.dialogue_ended
	sticky.hide()
	done_button.show()


func _on_done_pressed() -> void:
	lamp_canvas.hide();
