extends Control
@export var viewer_2007: TextureRect
@export var viewer_2006: TextureRect
@export var viewer_2005: TextureRect
signal make_me_front(name: String)



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	viewer_2005.hide()
	viewer_2006.hide()
	viewer_2007.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_2005_pressed() -> void:
	viewer_2005.show()


func _on_2006_pressed() -> void:
	viewer_2006.show()


func _on_2007_pressed() -> void:
	viewer_2007.show()


func _on_xbutton_pressed() -> void:
	hide()


func _on_title_bar_make_front() -> void:
	print(name)
	if name.contains("family"):
		print("this is family window")
		make_me_front.emit("fam")
	elif name.contains("taxes"):
		print("this is taxes window")
		make_me_front.emit("taxes")
