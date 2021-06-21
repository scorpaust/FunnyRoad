extends Spatial

var rot_speed = 5

func _ready():
	pass

func _process(delta):
	rotate_y(rot_speed * delta)

