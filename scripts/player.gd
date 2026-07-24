extends CharacterBody2D

@export var anim: AnimatedSprite2D
@export var push_speed = 20.0

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var just_side = false;
var just_up = false;
var pushing = false;

func _ready() -> void:
	pushing = false;
	just_side = true;

func _physics_process(delta: float) -> void:
	pushing = false;
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
	
	if Input.is_action_just_pressed("ui_left"):
		anim.play("walkside")
		just_side = true
		just_up = false
		anim.flip_h = true
	elif Input.is_action_just_pressed("ui_down"):
		anim.play("walkdown")
		just_up = false
		just_side = false
	elif Input.is_action_just_pressed("ui_up"):
		anim.play("walkup")
		just_up = true
		just_side = false
	elif Input.is_action_just_pressed("ui_right"):
		anim.play("walkside")
		just_side = true
		just_up = false
		anim.flip_h = false
		
	if velocity.x == 0 and velocity.y == 0:
		if just_side:
			anim.play("idleside")
		elif just_up:
			anim.play("idleup")
		elif !just_side and !just_up:
			anim.play("idle")
	
	var screen_size = get_viewport_rect().size
	
	global_position.x = clampf(global_position.x, 32, screen_size.x - 32)
	global_position.y = clampf(global_position.y, 32, screen_size.y - 32)
	move_and_slide()
	
	for i in get_slide_collision_count():
		pushing = true;
		var collision = get_slide_collision(i);
		var body = collision.get_collider();
		
		if body.has_method("push"):
			var push_dir = -1 * collision.get_normal()
			body.push(push_dir.normalized() * push_speed)
