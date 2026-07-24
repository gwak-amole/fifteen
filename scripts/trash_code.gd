extends Control
@export var line_edit = LineEdit
signal make_me_front(arg: String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if line_edit.text == "6453":
		DialogueHandler.trash_unlocked();
	else:
		line_edit.text = ""
		line_edit.placeholder_text = "Try again"


func _on_title_bar_make_front() -> void:
	make_me_front.emit("trash_code")


func _on_xbutton_pressed() -> void:
	hide()
