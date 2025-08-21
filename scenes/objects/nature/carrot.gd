extends Node2D

@export var mouse_detector : MouseDetector
@export var player_detector : PlayerDetector
@export var sprite : AnimatedSprite2D

var harvestable = false
var total_frames : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_detector.area_clicked.connect(_on_area_clicked)
	GameManagerGlobal.day_passes.connect(_continue_stage)
	total_frames = sprite.sprite_frames.get_frame_count("default")


func _process(_delta):
	if (player_detector.is_close and mouse_detector.mouse_in_area):
		sprite.modulate = Color.GRAY
	else:
		sprite.modulate = Color.WHITE


func _on_area_clicked() -> void:
	if (player_detector.is_close and harvestable):
		GameManagerGlobal.use_stamina(5)
		var object_layer := get_parent() as TileMapLayer
		object_layer.erase_cell(object_layer.local_to_map(position))
		queue_free()


func _set_harvestable() -> void:
	harvestable = true


func _continue_stage() -> void:
	if (sprite.frame < total_frames):
		sprite.frame += 1

	if (sprite.frame == total_frames - 1):
		_set_harvestable()
