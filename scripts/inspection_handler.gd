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
@export var player: CharacterBody2D
@export var drawer: CanvasLayer
@export var am: CharacterBody2D
@export var cutscene: AnimationPlayer
@export var caught_screen: CanvasLayer
@export var timer_animation: CanvasLayer

#audios
@export var drawer_audio: AudioStreamPlayer
@export var click: AudioStreamPlayer
@export var flip: AudioStreamPlayer
var lamp_on = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer_animation.hide();
	caught_screen.hide();
	am.hide()
	safe_screen.hide()
	desktop.hide();
	comp_login_screen.hide();
	lamp_canvas.hide()
	sticky.hide()
	drawer.hide();
	player.global_position = Vector2(145, 251)
	DialogueHandler.connect("checking_lamp", open_lamp)
	DialogueHandler.connect("trying_password", show_password_screen)
	DialogueHandler.connect("exiting_safe_view", exit_safe_view)
	DialogueHandler.connect("showing_safe_view", show_safe_view)
	DialogueHandler.connect("opening_drawer", open_drawer)
	DialogueHandler.connect("rewind", rewinding)
	DialogueHandler.connect("AM_walk_in", play_walk_in)
	DialogueHandler.connect("tick", rewind_timer_animation)
	DialogueHandler.connect("rewind_release", rewind_released)
	comp_login_screen.connect("exit_computer_login", exit_computer_login)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func open_lamp():
	lamp_canvas.show();

func _on_sticky_note_pressed() -> void:
	flip.play()
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
	click.play()
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
	desktop.initialize();
	comp_login_screen.hide();

func show_safe_view():
	safe_screen.show();

func exit_safe_view():
	safe_screen.hide()

func open_drawer():
	drawer_audio.play()
	drawer.show();
	
func rewinding():
	if get_tree():
		get_tree().reload_current_scene()

func play_walk_in():
	am.show()
	player.set_physics_process(false)
	cutscene.play("caught")
	caught_screen.show()
	await cutscene.animation_finished
	DialogueHandler.game_over();

func rewind_timer_animation():
	timer_animation.show();

func rewind_released():
	timer_animation.hide()
