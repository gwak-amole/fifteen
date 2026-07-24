extends Node

signal checking_lamp
signal trying_password
signal exiting_safe_view
signal showing_safe_view

var first_time_on_computer = true
var first_time_seeing_computer = true;
var saw_lamp_password = false
var knows_safe_code = false
var first_time_seeing_safe = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	saw_lamp_password = false
	first_time_on_computer = true
	knows_safe_code = false
	first_time_seeing_safe = true;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func check_lamp():
	checking_lamp.emit()

func try_password():
	trying_password.emit()

func exit_safe_view():
	exiting_safe_view.emit()
