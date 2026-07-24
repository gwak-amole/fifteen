extends CanvasLayer

signal exit_computer_login

@export var inspection_handler: Node
@export var line_edit = LineEdit
var tried = false;

# Called when the node enters the scene tree for the first time.
func initialize() -> void:
	tried = false;
	if DialogueHandler.first_time_on_computer:
		var resource = load("res://dialogues/computer_interaction.dialogue")
		DialogueManager.show_dialogue_balloon(resource, "login_screen")
		await DialogueManager.dialogue_ended;
		DialogueHandler.first_time_on_computer = false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_login_button_pressed() -> void:
	if line_edit.text == "UNICORNZ1":
		print("yay pass")
		inspection_handler.desktop_start();
	else:
		print("access denied")
		tried = true;
		line_edit.placeholder_text = "Try again"
		line_edit.text = "";


func _on_done_pressed() -> void:
	exit_computer_login.emit()
