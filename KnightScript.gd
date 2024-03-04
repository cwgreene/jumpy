extends AnimatedSprite2D

enum ANIMATION_STATE { AT_REST, MOVING, STANDING_ATTACKING, FAST_ATTACK}

var state = ANIMATION_STATE.AT_REST

# Called when the node enters the scene tree for the first time.
func _ready():
	self.state = ANIMATION_STATE.AT_REST
	self.play("AtRest")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var attack = false
	if Input.is_key_pressed(KEY_SPACE):
		attack = true
	# Handle Input
	var move_input = false
	if self.state != ANIMATION_STATE.STANDING_ATTACKING:
		if Input.is_key_pressed(KEY_A):
			self.transform.x.x=-1
			self.position.x -= 1
			move_input = true
		elif Input.is_key_pressed(KEY_D):
			self.transform.x.x=1
			self.position.x += 1
			move_input = true
	
	# Attack takes priority
	if attack or self.state == ANIMATION_STATE.STANDING_ATTACKING:
		if self.state != ANIMATION_STATE.STANDING_ATTACKING:
			self.state = ANIMATION_STATE.STANDING_ATTACKING
			self.play("Fast Slash")	
	elif move_input:
		if self.state != ANIMATION_STATE.MOVING:
			self.state = ANIMATION_STATE.MOVING
			self.play("Move")
	else:
		if self.state != ANIMATION_STATE.AT_REST:
			self.state = ANIMATION_STATE.AT_REST
			self.play("AtRest")
	# determine animation

func _on_animation_finished():
	pass
	
func _on_animation_looped():
	if self.state == ANIMATION_STATE.STANDING_ATTACKING:
		self.state = ANIMATION_STATE.AT_REST
		self.play("AtRest")
	

func _on_frame_changed():
	print(self.frame) # Replace with function body.
