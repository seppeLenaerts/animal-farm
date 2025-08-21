extends TileMapLayer


func _ready() -> void:
	pass # Replace with function body.


func _process(_delta: float) -> void:
	pass


func _unhandled_input(event):
	if (event is InputEventMouseButton and event.is_pressed()):
		var mouseEvent := event as InputEventMouseButton
		if (mouseEvent.button_mask == MOUSE_BUTTON_MASK_RIGHT):
			var ground_layer := get_parent() as TileMapLayer
			var clicked_coords = local_to_map(to_local(get_global_mouse_position()))
			var ground_layer_tile = ground_layer.get_cell_tile_data(clicked_coords)
			if (ground_layer_tile.get_custom_data("is_plantable")):
				set_cell(clicked_coords, 0, Vector2i.ZERO, 2)