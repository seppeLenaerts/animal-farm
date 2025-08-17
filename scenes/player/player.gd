extends CharacterBody2D

class_name Player

@export var camera : Camera2D
@export var sprite : AnimatedSprite2D

const SPEED = 133.0


func _physics_process(_delta: float) -> void:
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * SPEED
	
	_select_animation()
	_determine_flip_sprite()
	_play_animation_if_moving()
	move_and_slide()

func _select_animation():
	if velocity.y > 0 and velocity.x == 0:
		sprite.animation = "down"
	elif velocity.y < 0 and velocity.x == 0:
		sprite.animation = "up"
	elif velocity.x != 0:
		sprite.animation = "sideways"
		
func _determine_flip_sprite():
	if velocity.x > 0:
		sprite.flip_h = true
	elif velocity.x < 0:
		sprite.flip_h = false
		
func _play_animation_if_moving():
	if velocity != Vector2.ZERO:
		sprite.play()
	else:
		sprite.stop()

func _unhandled_input(event):
	if event is InputEventMouseButton:
		var mouse_event := event as InputEventMouseButton
		var zoom_vector := camera.zoom
		if mouse_event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom_vector -= Vector2(0.1, 0.1)
		elif mouse_event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom_vector += Vector2(0.1, 0.1)
		camera.zoom = zoom_vector.clamp(Vector2(1.0, 1.0), Vector2(4.5, 4.5))
