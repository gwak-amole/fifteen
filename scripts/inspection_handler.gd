extends Node

@export var lamp_canvas: CanvasLayer
@export var done_button: Button
@export var sticky: TextureRect
@export var anim: AnimationPlayer
@export var lamp_texture: TextureRect
@export var lamp_sprite: StaticBody2D
@export var comp_login_screen: CanvasLayer
@export var desktop: CanvasLayer
@export var safe_screen: CanvasLayer
var lamp_on = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	desktop.hide();
	comp_login_screen.hide();
	lamp_canvas.hide()
	sticky.hide()
	DialogueHandler.connect("checking_lamp", open_lamp)
	DialogueHandler.connect("trying_password", show_password_screen)
	DialogueHandler.connect("exiting_safe_view", exit_safe_view)
	DialogueHandler.connect("showing_safe_view", show_safe_view)
	comp_login_screen.connect("exit_computer_login", exit_computer_login)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func open_lamp():
	lamp_canvas.show();

func _on_sticky_note_pressed() -> void:
	var resource = load("res://dialogues/lamp_interaction.dialogue")
	done_button.hide()
	DialogueManager.show_dialogue_balloon(resource, "sticky_check")
	sticky.show()
	await DialogueManager.dialogue_ended
	DialogueHandler.saw_lamp_password = true;
	sticky.hide()
	done_button.show()


func _on_done_pressed() -> void:
	lamp_canvas.hide();


func _on_lamp_string_pressed() -> void:
	anim.play("lamp_pull")
	await anim.animation_finished
	if lamp_on:
		lamp_texture.texture = load("res://assets/lamp inspection/lamp_off.png")
		lamp_on = false
		lamp_sprite.get_node("Sprite2D").texture = load("res://assets/map/furniture/lamp_off.png")
	elif !lamp_on:
		lamp_texture.texture = load("res://assets/lamp inspection/lamp_on.png")
		lamp_sprite.get_node("Sprite2D").texture = load("res://assets/map/furniture/lamp.png")
		lamp_on = true

func show_password_screen():
	comp_login_screen.show();
	comp_login_screen.initialize();

func exit_computer_login():
	comp_login_screen.hide();
	
func desktop_start():
	desktop.show();
	comp_login_screen.hide();

func show_safe_view():
	safe_screen.show();

func exit_safe_view():
	safe_screen.hide()
