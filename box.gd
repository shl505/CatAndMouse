extends Area2D
signal cat_is_eated
signal cat_is_damaged

var random_animal
var selected_animal
var cat_is_enter = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$MouseImage.hide()
	$DogImage.hide()
	random_animal = ["mouse", "dog"]
	selected_animal = random_animal.pick_random()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cat_is_enter:
		if Input.is_action_just_pressed("spase"):
			if selected_animal == "mouse":
				$MouseImage.hide()
				cat_is_eated.emit()
			else :
				$DogImage.hide()
				cat_is_damaged.emit()
				
				


func _on_body_entered(_body):
	if selected_animal == "mouse" and $BoxImage.visible:
		$MouseImage.show()
		$MouseSound.play()
	elif $BoxImage.visible:
		$DogImage.show()
		$DogSound.play()
	$BoxImage.hide()
	cat_is_enter = true
	$BoxTimer.start()

func _on_body_exited(_body):
	$MouseImage.hide()
	$DogImage.hide()
	$BoxImage.show()
	cat_is_enter = false
	selected_animal = random_animal.pick_random()


func _on_box_timer_timeout():
	$BoxImage.hide()
	$MouseImage.hide()
	$DogImage.hide()
	$Timer.start()
	cat_is_enter = false


func _on_timer_timeout():
	$BoxImage.show()
	
	selected_animal = random_animal.pick_random()
