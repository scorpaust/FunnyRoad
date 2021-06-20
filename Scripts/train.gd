extends Spatial

func _ready():
	pass

func _process(delta):
	
	translation.x += 20 * delta
	
	if translation.x >= 100:
		queue_free()
	
	pass
