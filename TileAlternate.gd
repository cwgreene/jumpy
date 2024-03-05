extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouse:
		if event.is_pressed():
			var cell = self.local_to_map(event.position)
			var celldata = self.get_cell_atlas_coords(0, cell)
			var idx = ((celldata.x + 2*celldata.y) + 1) % 4
			var newpos = Vector2i(idx % 2, (idx/2))
			self.set_cell(0, cell, 0, newpos)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
