extends CanvasLayer

@export var input_code: Panel
@export var line_edit: LineEdit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	input_code.hide();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	input_code.show();


func _on_code_go_pressed() -> void:
	if line_edit.text == "9872":
		print("yay")
	else:
		print("access denied")
