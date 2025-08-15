extends Area2D

@export var sprite: Sprite2D

var mouse_in_area = false

func _on_mouse_entered():
	mouse_in_area = true
	sprite.modulate = Color(0.8, 0.6, 0.7)

func _on_mouse_exited():
	mouse_in_area = false
	sprite.modulate = Color.WHITE

func _ready():
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _unhandled_input(event):
	if mouse_in_area and event is InputEventMouseButton:
		var mouse_event := event as InputEventMouseButton
		if mouse_event.button_mask == MOUSE_BUTTON_MASK_LEFT:
			print("WOIOIOIOIWIIW")
