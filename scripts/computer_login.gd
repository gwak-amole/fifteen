extends CanvasLayer

@export var line_edit = LineEdit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_login_button_pressed() -> void:
	if line_edit.text == "UNICORNZ1":
		print("yay pass")
	else:
		print("access denied")
