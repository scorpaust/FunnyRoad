extends Spatial

export var speed = 10

func _ready():
	pass

func _process(delta):
	
	translation.x += speed * delta
	
	if translation.x >= 60:
		queue_free()
	
	pass
