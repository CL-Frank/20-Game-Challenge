extends GPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	one_shot = true
	emitting = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	await finished
	queue_free()
