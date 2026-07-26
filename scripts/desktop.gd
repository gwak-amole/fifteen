extends CanvasLayer

@export var taxes_window: Control
@export var fam_window: Control
@export var vacation_window: Control
@export var documents_window: Control
@export var trash_window: Control
@export var trash_code_window: Control

@export var trash_sound: AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	taxes_window.hide()
	fam_window.hide()
	vacation_window.hide()
	documents_window.hide();
	trash_window.hide();
	trash_code_window.hide();
	DialogueHandler.connect("unlocking_trash", unlock_trash)

func initialize():
	DialogueHandler.seen_desktop = true;


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
	if arg == "documents":
		move_child(documents_window, -1)


func _on_documents_window_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			move_child(documents_window, -1);


func _on_trash_make_me_front(arg: String) -> void:
	if arg == "documents":
		move_child(trash_window, -1)


func _on_trash_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			move_child(trash_window, -1);


func _on_trash_pressed() -> void:
	trash_sound.play()
	if DialogueHandler.trash_unlock:
		trash_window.show();
		move_child(trash_window, -1);
	else:
		trash_code_window.show();
		move_child(trash_code_window, -1)


func _on_power_off_pressed() -> void:
	hide()

func unlock_trash():
	trash_window.show();
	trash_code_window.hide()
	move_child(trash_window, -1)


func _on_trash_code_make_me_front(arg: String) -> void:
	trash_sound.play()
	move_child(trash_code_window, -1)
