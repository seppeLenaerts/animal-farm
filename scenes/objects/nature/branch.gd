extends StaticBody2D

@export var mouse_detector : MouseDetector
@export var player_detector : PlayerDetector
@export var sprite : Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_detector.area_clicked.connect(_on_area_clicked)


func _process(_delta):
	if (player_detector.is_close and mouse_detector.mouse_in_area):
		sprite.modulate = Color.GRAY
	else:
		sprite.modulate = Color.WHITE


func _on_area_clicked() -> void:
	if (player_detector.is_close):
		queue_free()
