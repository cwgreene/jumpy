extends Button

signal selected_tile(selected)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _gui_input(event):
	if event is InputEventMouse:
		if event.is_pressed():
			var tilemap = get_child(0) as TileMap
			print(tilemap)
			var selected = tilemap.get_cell_atlas_coords(0, Vector2i(0,0))
			selected_tile.emit(selected)
