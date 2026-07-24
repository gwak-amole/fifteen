extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_xbutton_7_pressed() -> void:
	if name.contains("nothing"):
		hide()


func _on_xbutton_6_pressed() -> void:
	if name.contains("msg"):
		hide()
