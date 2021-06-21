extends Node

const new_car1 = preload("res://Scenes/car1.tscn")

const new_car2 = preload("res://Scenes/car2.tscn")

const new_car3 = preload("res://Scenes/car3.tscn")

const new_train = preload("res://Scenes/train.tscn")

func _ready():
	count_life()

func _process(delta):
	if get_node("Camera Position").translation.z >= -30:		
		get_node("Camera Position").translate(Vector3(0,0,-1) * delta)

func _on_Spawn_1_timeout():	
	spawn_car("Car Position/Car 1")
	spawn_car("Car Position/Car 2")
	spawn_car("Car Position/Car 3")
	spawn_car("Car Position/Car 4")

func spawn_car(position):
	
	randomize()
	
	var r = int(rand_range(0,3))
	
	var car = new_car1

	if r == 0:
		car = new_car1.instance()
	
	elif r == 1:
		car = new_car2.instance()
	
	else:
		car = new_car3.instance()
	
	
	get_node(position).add_child(car)	
	
	get_node("Car Position/Spawn 1").wait_time = rand_range(0.5, 2)

func spawn_train():
	var train = new_train.instance()
	
	get_node("Car Position/Train").add_child(train)


func _on_Train_Spawn_timeout():
	spawn_train()
	pass # Replace with function body.


func _on_Area_area_entered(area):
	
	if get_node("Player").alive:
		if area.name == "Car":
			index.life -= 1
			get_node("Player/Anim").play("Smashed")
			get_node("Player").alive = false
		
		if area.name == "TrainArea":
			index.life -= 1
			get_node("Player/Anim").play("Smashed")
			get_node("Player").alive = false
		
		if area.name == "CoinArea" or area.name == "CoinArea2":
			index.pts += 1
			get_node("Sign/Score").text = str(index.pts)
			area.get_parent().queue_free()
			
func _on_Anim_animation_finished(anim_name):
	if index.life >= 0:
		get_tree().reload_current_scene()

func count_life():
	
	if index.life == 2:
		get_node("Sign/3").hide()
		
	elif index.life == 1:
		get_node("Sign/3").hide()
		get_node("Sign/2").hide()

	elif index.life == 0:
		get_node("Calls/Anim").play("GameOver")


func _on_End_area_entered(area):
	if area.name == "PlayerArea":
		if index.pts == 10:
			get_tree().change_scene()
