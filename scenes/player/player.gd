extends CharacterBody2D

class_name Player

@export var camera : Camera2D

const SPEED = 233.0


func _physics_process(_delta: float) -> void:
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * SPEED
	move_and_slide()

func _unhandled_input(event):
	if event is InputEventMouseButton:
		var mouse_event := event as InputEventMouseButton
		var zoom_vector := camera.zoom
		if mouse_event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom_vector -= Vector2(0.1, 0.1)
		elif mouse_event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom_vector += Vector2(0.1, 0.1)
		camera.zoom = zoom_vector.clamp(Vector2(1.0, 1.0), Vector2(4.5, 4.5))
