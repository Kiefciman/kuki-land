extends CharacterBody2D

var speed = 40
var facing_direction = 'down'
var direction: Vector2

func Animations():
	if direction.x > 0:
		$AnimatedSprite2D.animation = 'walking_right'
		facing_direction = 'right'
	elif direction.x < 0:
		$AnimatedSprite2D.animation = 'walking_left'
		facing_direction = 'left'
	else:
		if direction.y > 0:
			$AnimatedSprite2D.animation = 'walking_down'
			facing_direction = 'down'
		elif direction.y < 0:
			$AnimatedSprite2D.animation = 'walking_up'
			facing_direction = 'up'
		else:
			$AnimatedSprite2D.animation = 'idle_' + facing_direction

func Movement():
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").limit_length()
	velocity = direction * speed
	move_and_slide()

func Interact():
	var selected_tile = Maps.selected_tile
	if Input.is_action_just_pressed("right_click"):
		#print(selected_tile)
		match selected_tile.type:
			'tree':
				for tree in get_parent().get_node('trees').get_children():
					var position = str([tree.global_position.x / 32, tree.global_position.y / 32])
					if position == selected_tile.position:
						tree.visible = false
						tree.queue_free()
						Maps.map[str([tree.global_position.x / 32, tree.global_position.y / 32])] = null
						#TODO tree.shake() and tree.fall()

func _ready():
	$AnimatedSprite2D.animation = 'idle_down'
	$AnimatedSprite2D.play()

func _physics_process(delta):
	Animations()
	Movement()
	Interact()
