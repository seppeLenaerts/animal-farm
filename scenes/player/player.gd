extends CharacterBody2D

class_name Player

@export var camera : Camera2D
@export var sprite : AnimatedSprite2D
@export var tilemaplayer : TileMapLayer

const SPEED = 133.0

const ANIMATION_MAPPING := {
	"water": {
		"sideways": "sideways_water",
		"up": "up_water",
		"down": "down_water",
		},
	"ground": {
		"sideways": "sideways",
		"up": "up",
		"down": "down",
		}
}


func _physics_process(_delta: float) -> void:
	var local_pos := tilemaplayer.to_local(global_position)
	var cell := tilemaplayer.get_cell_tile_data(tilemaplayer.local_to_map(local_pos))
	var is_water_tile : bool = cell.get_custom_data("is_water_tile")
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * SPEED
	_select_animation(is_water_tile)
	_determine_flip_sprite()
	_play_animation_if_moving()
	_consume_stamina_if_moving()
	move_and_slide()
	

func _select_animation(is_water_tile: bool = false):
	if is_water_tile:
		if velocity.y > 0 and velocity.x == 0:
			sprite.animation = "down_water"
		elif velocity.y < 0 and velocity.x == 0:
			sprite.animation = "up_water"
		elif velocity.x != 0:
			sprite.animation = "sideways_water"
	else:
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

func _consume_stamina_if_moving():
	if velocity != Vector2.ZERO:
		GameManagerGlobal.use_stamina(0.03)

func _unhandled_input(event):
	if event is InputEventMouseButton:
		var mouse_event := event as InputEventMouseButton
		var zoom_vector := camera.zoom
		if mouse_event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom_vector -= Vector2(0.1, 0.1)
		elif mouse_event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom_vector += Vector2(0.1, 0.1)
		camera.zoom = zoom_vector.clamp(Vector2(1.0, 1.0), Vector2(4.5, 4.5))
