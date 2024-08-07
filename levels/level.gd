extends Node2D

@export var map_width: int = 15
@export var map_height: int = 10
@export var tree_scene: PackedScene
@export var tree_spawner_scene: PackedScene
@export var ground_scene: PackedScene

var save_data = {}
var ground_map = []
var tree_spawner_map = []
var tree_map = []

func TreeSpawnerGeneration():
	for y in range(map_height):
		if y < map_height / 3:
			continue
		if y > map_height - map_height / 3:
			continue

		for x in range(map_width):
			if x < map_width / 3:
				continue
			if x > map_width - map_width / 3:
				continue

			var probability = randi_range(1, 100)
			if probability < 85:
				continue
			
			var position = [(x + 1) * 32, (y + 1) * 32]
			tree_spawner_map.append(position)
			
	save_data.tree_spawner_map = tree_spawner_map
			
func TreeGeneration():
	for tree_spawner in save_data.tree_spawner_map:
		#var position = [tree_spawner[0], tree_spawner[1]]
		var tree = tree_scene.instantiate()
		$trees.add_child(tree)
		tree.global_position = Vector2(tree_spawner[0], tree_spawner[1])
	
func GroundTopBottom(y):
	for x in range(map_width):
		var probability = randi_range(1, 100)
		if probability > 40:
			var position = [(x + 1) * 32, y]
			ground_map.append(position)
			#var ground = ground_scene.instantiate()
			#$grounds.add_child(ground)
			#ground.global_position = Vector2((x + 1) * 32, y)
			
func GroundLeftRight(x, y):
	var probability = randi_range(1, 100)
	if probability > 40:
		var position = [x, y * 32]
		ground_map.append(position)
		#var ground = ground_scene.instantiate()
		#$grounds.add_child(ground)
		#ground.global_position = Vector2(x, y * 32)
			
func GroundGeneration():
	GroundTopBottom(1)
		
	for y in range(map_height):
		if y > 1 and y < map_height:
			GroundLeftRight(1, y)
			GroundLeftRight(map_width * 32 + 32, y)
		
		for x in range(map_width):
			var position = [(x + 1) * 32, (y + 1) * 32]
			ground_map.append(position)
			#var ground = ground_scene.instantiate()
			#$grounds.add_child(ground)
			#ground.global_position.x = (x + 1) * 32
			#ground.global_position.y = (y + 1) * 32
			
	GroundTopBottom(map_height * 32 + 32)
	
	save_data.ground_map = ground_map
			
func LoadGround():
	for position in save_data.ground_map:
		var ground = ground_scene.instantiate()
		$grounds.add_child(ground)
		ground.global_position.x = position[0]
		ground.global_position.y = position[1]
	
func GenerateMap():
	GroundGeneration()
	TreeSpawnerGeneration()
		
func _ready():
	if SaveManager.CheckSaveFile():
		save_data = SaveManager.LoadSave()
	else:
		GenerateMap()
		SaveManager.WriteSave(save_data)
		
	print(save_data)
	LoadGround()
	TreeGeneration()
		
func _process(delta):
	for tree in $trees.get_children():
		if tree.get_node('origin').global_position.y > $player.get_node('origin').global_position.y:
			tree.z_index = $player.z_index + 1
		else:
			tree.z_index = $player.z_index - 1
