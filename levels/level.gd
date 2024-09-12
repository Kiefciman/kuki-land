extends Node2D

@export var map_width: int = 15
@export var map_height: int = 10
@export var tree_scene: PackedScene
@export var tree_spawner_scene: PackedScene
@export var ground_scene: PackedScene
@export var tile_select_scene: PackedScene
@export var cursor_scene: PackedScene

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
			Maps.tree_spawner_map.append(position)
			
	Maps.save_data.tree_spawner_map = Maps.tree_spawner_map
			
func TreeGeneration():
	for tree_spawner in Maps.save_data.tree_spawner_map:
		#var position = [tree_spawner[0], tree_spawner[1]]
		var tree = tree_scene.instantiate()
		$trees.add_child(tree)
		tree.global_position = Vector2(tree_spawner[0], tree_spawner[1])
		#tree_map.append([tree.global_position.x / 32, tree.global_position.y / 32])
		Maps.map[str([tree.global_position.x / 32, tree.global_position.y / 32])] = 'tree'
	
func GroundTopBottom(y):
	for x in range(map_width):
		var probability = randi_range(1, 100)
		if probability > 40:
			var position = [(x + 1) * 32, y]
			Maps.ground_map.append(position)
			#var ground = ground_scene.instantiate()
			#$grounds.add_child(ground)
			#ground.global_position = Vector2((x + 1) * 32, y)
			
func GroundLeftRight(x, y):
	var probability = randi_range(1, 100)
	if probability > 40:
		var position = [x, y * 32]
		Maps.ground_map.append(position)
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
			Maps.ground_map.append(position)
			#var ground = ground_scene.instantiate()
			#$grounds.add_child(ground)
			#ground.global_position.x = (x + 1) * 32
			#ground.global_position.y = (y + 1) * 32
			
	GroundTopBottom(map_height * 32 + 32)
	
	Maps.save_data.ground_map = Maps.ground_map
			
func LoadGround():
	for position in Maps.save_data.ground_map:
		var ground = ground_scene.instantiate()
		$grounds.add_child(ground)
		ground.global_position.x = position[0]
		ground.global_position.y = position[1]
	
func GenerateMap():
	GroundGeneration()
	TreeSpawnerGeneration()
		
func AddTileSelect():
	var tile_select = tile_select_scene.instantiate()
	$ui.add_child(tile_select)

func CheckTile():
	var tile = str($ui/tile_select.mouse_global_position)

	if tile == '[null, null]':
		return
		
	if Maps.map.has(tile):
		#print(map[tile], tile)
		Maps.selected_tile.type = Maps.map[tile]
	else:
		Maps.selected_tile.type = 'ground'
		
	Maps.selected_tile.position = tile
	
func ZOrder(objects):
	for object in self.get_node(objects).get_children():
		if object.get_node('origin').global_position.y > $player.get_node('origin').global_position.y:
			object.z_index = $player.z_index + 1
		else:
			object.z_index = $player.z_index - 1
	
func _ready():
	var cursor = cursor_scene.instantiate()
	self.add_child(cursor)
	
	if SaveManager.CheckSaveFile():
		Maps.save_data = SaveManager.LoadSave()
	else:
		GenerateMap()
		SaveManager.WriteSave(Maps.save_data)
		
	#print(save_data)
	LoadGround()
	TreeGeneration()
	AddTileSelect()
	#print(map)
		
func _process(delta):
	ZOrder('trees')
	ZOrder('items')
			
	CheckTile()
	#print(selected_tile)
