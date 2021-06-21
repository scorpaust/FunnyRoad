extends Spatial

var alive = true

func _ready():
	pass

func _process(delta):
	movement()
		
	pass

func movement():
	
	if alive:	
		if Input.is_action_just_pressed("ui_up"):
			translation.z += -2 
			translation.y += 2
			rotation_degrees.y = 0
			
		if Input.is_action_just_pressed("ui_down"):
			translation.z += 2 
			translation.y += 2
			rotation_degrees.y = 180
		
		if Input.is_action_just_pressed("ui_right"):
			translation.x += 2 
			translation.y += 2
			rotation_degrees.y = -90

		if Input.is_action_just_pressed("ui_left"):
			translation.x += -2 
			translation.y += 2
			rotation_degrees.y = 90
