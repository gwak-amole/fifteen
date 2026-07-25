extends StaticBody2D

@export var sprite: Sprite2D
@export var reg_area: Area2D
@export var mirror_area: Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_interaction_body_entered(body: Node2D) -> void:
	if body.name == "player":
		sprite.texture = load("res://assets/map/furniture/wardrobe_select.png")
		DialogueHandler.can_interact();
		DialogueHandler.last_name = name

func _on_interaction_body_exited(body: Node2D) -> void:
	if body.name == "player":
		var a = mirror_area.get_overlapping_bodies();
		var player_in = false
		for i in a:
			if i.name == "player":
				player_in = true
		if !player_in:
			sprite.texture = load("res://assets/map/furniture/wardrobe.png")
			DialogueHandler.cannot_interact();
		DialogueHandler.last_name = "mirror"


func _on_interaction_mirror_body_entered(body: Node2D) -> void:
	if body.name == "player":
		sprite.texture = load("res://assets/map/furniture/mirror_select.png")
		DialogueHandler.can_interact();
		DialogueHandler.last_name = "mirror"

func _on_interaction_mirror_body_exited(body: Node2D) -> void:
	if body.name == "player":
		var a = reg_area.get_overlapping_bodies();
		var player_in = false
		for i in a:
			if i.name == "player":
				player_in = true
		if !player_in:
			sprite.texture = load("res://assets/map/furniture/wardrobe.png")
			DialogueHandler.cannot_interact();
		DialogueHandler.last_name = name
