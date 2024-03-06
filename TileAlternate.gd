extends TileMap

var toggle = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouse:
		if event.is_pressed():
			toggle = true
		if event.is_released() and toggle:
			toggle = false
			var cell = self.local_to_map(event.position)
			var atlas = self.get_cell_atlas_coords(0, cell)
			print(atlas)
			if atlas == Vector2i(-1,-1):
				print("Unmapped")
				return
			var idx = ((atlas.x + 2*atlas.y) + 1) % 4
			var newpos = Vector2i(idx % 2, (idx/2))
			print(newpos)
			self.set_cell(0, cell, 0, newpos)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
