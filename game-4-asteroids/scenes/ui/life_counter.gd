extends Node2D



@export var life_sprite: Texture2D
var sprite_offset: Vector2

var initial_lives:int = 3
var current_lives:int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.lives_changed.connect(on_lives_changed)
	current_lives = initial_lives
	sprite_offset = Vector2(life_sprite.get_width() + 8,0)
	display_lives()

func display_lives() -> void:
	for item in get_children():
		item.queue_free()
		
	for item in range(1, current_lives + 1):
		var sprite = Sprite2D.new()
		sprite.texture = life_sprite
		sprite.position = (item - 1) * sprite_offset
		add_child(sprite)

func on_lives_changed(lives:int) -> void:
	current_lives = lives
	display_lives()
