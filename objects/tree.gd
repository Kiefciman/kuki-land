extends StaticBody2D

@export var log_scene :PackedScene

var hp: int
var shaking_finished: bool = true
var falling_finished: bool = false
var direction_to_fall: String

func GetDamaged(dmg):
	hp -= dmg

func Shake():
	$AnimationPlayer.current_animation = 'shake'
	shaking_finished = false
	falling_finished = false
	
func Chop(dmg, direction):
	if shaking_finished:
		Shake()
		GetDamaged(dmg)
		#print(hp)
		direction_to_fall = direction
		
func DropLogs():
	var logs: int = randi_range(1, 2)
	#var amount: int = floori(logs + (luck / 10))
	for i in range(logs):
		var log = log_scene.instantiate()
		self.get_parent().get_parent().get_node('items').add_child(log)
		log.global_position = self.global_position + Vector2(i * 10, i * 10)
	
func Fall():
	if direction_to_fall == 'left':
		$AnimationPlayer.current_animation = 'fall_left'
	else:
		$AnimationPlayer.current_animation = 'fall_right'
	
	if falling_finished:
		self.visible = false
		DropLogs()
		self.queue_free()
		Maps.map.erase(str([self.global_position.x / 32, self.global_position.y / 32]))
	
func _ready():
	hp = randi_range(100, 200)

func _process(delta):
	if hp <= 0:
		Fall()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
		shaking_finished = true
		falling_finished = true
