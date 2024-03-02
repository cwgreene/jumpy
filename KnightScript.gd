extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hello")
	self.play("AtRest")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_A):
		self.transform.x.x=-1
		self.position.x -= 1
		self.play("Move")
	elif Input.is_key_pressed(KEY_D):
		self.transform.x.x=1
		self.position.x += 1
		self.play("Move")
	else:
		self.play("AtRest")
