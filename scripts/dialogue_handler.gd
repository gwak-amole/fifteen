extends Node

signal checking_lamp
signal trying_password
signal exiting_safe_view
signal showing_safe_view
signal taking_shipment
signal unlocking_trash
signal player_show_e
signal player_hide_e

var first_time_on_computer = true
var first_time_seeing_computer = true;
var saw_lamp_password = false
var knows_safe_code = false
var first_time_seeing_safe = true;
var took_files = false;
var seen_desktop = false
var trash_unlock = false
var last_name: String = ""
var is_inside = false;
var played_once = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	played_once = false;
	is_inside = false
	trash_unlock = false
	seen_desktop = false
	saw_lamp_password = false
	first_time_on_computer = true
	knows_safe_code = false
	first_time_seeing_safe = true;
	took_files = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func check_lamp():
	checking_lamp.emit()

func try_password():
	trying_password.emit()

func exit_safe_view():
	exiting_safe_view.emit()

func take_shipment():
	taking_shipment.emit()
	took_files = true;

func trash_unlocked():
	trash_unlock = true;
	unlocking_trash.emit()
	
func end_game():
	print("game over")
	
func can_interact():
	is_inside = true;
	player_show_e.emit();
	
func cannot_interact():
	is_inside = false;
	player_hide_e.emit();
	
func reload_e_interaction():
	await get_tree().create_timer(0.25).timeout
	played_once = false;
