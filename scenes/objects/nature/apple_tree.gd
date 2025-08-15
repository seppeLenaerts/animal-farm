extends StaticBody2D

@export var mouse_area : MouseDetector
@export var sprite_to_hide : Sprite2D

func _ready() -> void:
	mouse_area.area_clicked.connect(_apple_tree_clicked)


func _process(_delta: float) -> void:
	if (mouse_area.mouse_in_area):
		sprite_to_hide.modulate = Color.GRAY
	else:
		sprite_to_hide.modulate = Color.WHITE


func _apple_tree_clicked() -> void:
	sprite_to_hide.hide()