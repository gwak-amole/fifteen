extends CharacterBody2D


@export var anim: AnimatedSprite2D

func _physics_process(delta: float) -> void:
	pass

	move_and_slide()

func play_walk():
	anim.play("walk")

func play_idle():
	anim.play("idle")
