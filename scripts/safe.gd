extends CanvasLayer

@export var input_code: Panel
@export var line_edit: LineEdit
@export var unlocked_safe: Control
@export var locked_safe: Control
@export var shipment_button: TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueHandler.connect("take_shipment", hide_shipment)
	input_code.hide();
	unlocked_safe.hide();
	locked_safe.show();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	input_code.show();


func _on_code_go_pressed() -> void:
	if line_edit.text == "9872":
		print("yay")
		unlocked_safe.show()
		locked_safe.hide()
	else:
		print("access denied")

func hide_shipment():
	shipment_button.hide()
