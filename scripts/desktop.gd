extends CanvasLayer

@export var taxes_window: Control
@export var fam_window: Control
@export var vacation_window: Control
@export var documents_window: Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	taxes_window.hide()
	fam_window.hide()
	vacation_window.hide()
	documents_window.hide();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_taxes_pressed() -> void:
	taxes_window.show();
	move_child(taxes_window, -1);
	

func _on_family_pressed() -> void:
	fam_window.show();
	move_child(fam_window, -1);


func _on_taxes_window_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			move_child(taxes_window, -1);


func _on_family_window_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			move_child(fam_window, -1);


func _on_taxes_window_make_me_front(arg: String) -> void:
	if arg == "taxes":
		move_child(taxes_window, -1)


func _on_family_window_make_me_front(arg: String) -> void:
	if arg == "fam":
		move_child(fam_window, -1)


func _on_vacation_window_make_me_front(arg: String) -> void:
	if arg == "vacation":
		move_child(vacation_window, -1)


func _on_vacation_pressed() -> void:
	vacation_window.show();
	move_child(vacation_window, -1);


func _on_vacation_window_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			move_child(vacation_window, -1);


func _on_documents_pressed() -> void:
	documents_window.show();
	move_child(documents_window, -1);


func _on_documents_window_make_me_front(arg: String) -> void:
	print(arg)
	if arg == "documents":
		move_child(documents_window, -1)


func _on_documents_window_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			move_child(documents_window, -1);
