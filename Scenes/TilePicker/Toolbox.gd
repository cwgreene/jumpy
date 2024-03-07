extends ColorRect
class_name Toolbox

var current_tile = Vector2i(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	for node in get_children():
		if node.is_in_group("ToolboxButtons"):
			print(node)
			node.connect("selected_tile", on_selected_tile_changed) # Replace with function body.

func on_selected_tile_changed(selected):
	print("hello", selected)
	current_tile = selected

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
