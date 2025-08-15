extends CharacterBody2D

class_name Player

@export var camera : Camera2D
@export var sprite : AnimatedSprite2D

const SPEED = 133.0


func _physics_process(_delta: float) -> void:
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * SPEED

	if velocity.x > 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false

	if velocity.y == 0:
		sprite.animation = "sideways"
	else:
		sprite.animation = "down"


	if velocity != Vector2.ZERO:
		sprite.play()
	else:
		sprite.stop()
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
