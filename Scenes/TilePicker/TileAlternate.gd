extends TileMap

var toggle = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# We're using unhandled input here to let the gui have the
# first crack at all events.
func _unhandled_input(event):
	if event is InputEventMouse:
		var toolbox = get_tree().get_first_node_in_group("Toolbox")
		print(toolbox)
		var active_tile = toolbox.current_tile
		self.clear_layer(1)
		var cell = self.local_to_map(event.position)
		self.set_cell(1, cell, 0, active_tile)
		if event.is_pressed():
			print("I saw the input.")
			toggle = true
		if event.is_released() and toggle:
			toggle = false
			var atlas = self.get_cell_atlas_coords(0, cell)
			self.set_cell(0, cell, 0, get_tree().get_first_node_in_group("Toolbox").current_tile)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
