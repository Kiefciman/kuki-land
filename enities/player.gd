extends CharacterBody2D

var speed = 60
var facing_direction = 'down'

func _ready():
	$AnimatedSprite2D.animation = 'idle_down'
	$AnimatedSprite2D.play()

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").limit_length()
	
	velocity = direction * speed

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
			if facing_direction == 'up':
				$AnimatedSprite2D.animation = 'idle_up'
			elif facing_direction == 'down':
				$AnimatedSprite2D.animation = 'idle_down'
			elif facing_direction == 'left':
				$AnimatedSprite2D.animation = 'idle_left'
			elif facing_direction == 'right':
				$AnimatedSprite2D.animation = 'idle_right'

	move_and_slide()
