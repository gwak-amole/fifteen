extends Node

signal checking_lamp
signal trying_password
signal exiting_safe_view
signal showing_safe_view
signal taking_shipment
signal unlocking_trash
signal player_show_e
signal player_hide_e

# general game signals
signal update_time
signal update_run
signal rewind

# general game stuff
var current_run: int = 1;
var time_remaining:=180.0
var evidence_collected: int;
var hold_time: float = 0;

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
	time_remaining -= delta
	update_time.emit()
	if time_remaining <= 0:
		rewind.emit()
		game_over();
	
	if Input.is_action_pressed("r"):
		hold_time += delta;
		if hold_time >= 3.0:
			print("rewinding")
			rewind.emit();
			rewind_game()
			hold_time = 0;
			
	if Input.is_action_just_released("r"):
		hold_time = 0;

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

func rewind_game():
	print("rewinding game")
	current_run += 1
	time_remaining = 180.0
	if current_run > 3:
		game_over();

func game_over():
	print("game_over")
