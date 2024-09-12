extends CharacterBody2D

var speed:int = 40
var facing_direction:String = 'down'
var direction:Vector2
var axe_dmg:int = 30
var equipped_tool:String = 'axe'
var axe_distance:int = 60
var luck:int = 10

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

func ChopTree(selected_tile):
	if equipped_tool != 'axe':
		return
		
	for tree in get_parent().get_node('trees').get_children():
		var position = str([tree.global_position.x / 32, tree.global_position.y / 32])
		
		if self.global_position.distance_to(tree.global_position) > axe_distance:
			continue
		
		if position != selected_tile.position:
			continue
			
		var direction_to_fall
		if self.global_position.x <= tree.global_position.x:
			direction_to_fall = 'right'
		else:
			direction_to_fall = 'left'
			
		tree.Chop(axe_dmg, direction_to_fall)
						
func Interact():
	var selected_tile = Maps.selected_tile
	if Input.is_action_just_pressed("right_click"):
		#print(selected_tile)
		self.get_parent().get_node('Cursor').Click()
		match selected_tile.type:
			'tree':
				ChopTree(selected_tile)

func PickUp():
	for item in self.get_parent().get_node('items').get_children():
		if $origin.global_position.distance_to(item.global_position) <= 20:
			item.visible = false
			item.queue_free()
	
func _ready():
	$AnimatedSprite2D.animation = 'idle_down'
	$AnimatedSprite2D.play()

func _physics_process(delta):
	Animations()
	Movement()
	Interact()
	PickUp()
