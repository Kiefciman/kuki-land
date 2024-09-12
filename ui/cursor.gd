extends Node2D

@export var normal: Texture2D
@export var axe: Texture2D

var offset: Vector2

func Click():
	if $Sprite2D.texture != normal:
		$AnimationPlayer.current_animation = 'click'

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$Sprite2D.texture = axe

func _process(delta: float) -> void:
	var selected_tile = Maps.selected_tile
	
	match selected_tile.type:
		'tree':
			$Sprite2D.texture = axe
			offset = Vector2(0, 0)
		_:
			$Sprite2D.texture = normal
			offset = Vector2(16, 16)

	self.global_position = get_global_mouse_position() + offset
