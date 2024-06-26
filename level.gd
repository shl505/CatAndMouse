extends Node2D

var score = 0
var life = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	$Box.position.x = get_window().size.length() / 5 - 65
	$Box2.position.x = get_window().size.length() / 5 * 2 - 65
	$Box3.position.x = get_window().size.length() / 5 * 3 - 65
	$Box4.position.x = get_window().size.length() / 5 * 4 - 65
	
	$Box.position.y = 400
	$Box2.position.y = 400
	$Box3.position.y = 400
	$Box4.position.y = 400
	
	$Cat.position = Vector2(526, 430)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_score()
	update_life()
	if Input.is_action_pressed("left") and $Cat.position.x > 60:
		$Cat.position.x -= 500 * delta
		$Cat/AnimatedSprite2D.play()
		$Cat/AnimatedSprite2D.flip_h = true
	elif Input.is_action_pressed("right") and $Cat.position.x < 1110:
		$Cat.position.x += 500 * delta
		$Cat/AnimatedSprite2D.play()
		$Cat/AnimatedSprite2D.flip_h = false
	else :
		$Cat/AnimatedSprite2D.stop()
	if life == 0:
		game_over()
	if not $AudioStreamPlayer.playing:
		$AudioStreamPlayer.play()
		
		

func update_score():
	$Score.text = " score:" + (str(score))

func update_life():
	$Life.text = "life: " + (str(life))

func game_over():
	$Label.text = "game over.\nyour score is: " + str(score)
	$EndTimer.start()
	$Cat.hide()
	$AudioStreamPlayer.stop()
	
	

func _on_box_cat_is_damaged():
	life -= 1


func _on_box_cat_is_eated():
	score += 1


func _on_box_2_cat_is_damaged():
	life -= 1


func _on_box_2_cat_is_eated():
	score += 1


func _on_box_3_cat_is_damaged():
	life -= 1


func _on_box_3_cat_is_eated():
	score += 1


func _on_box_4_cat_is_damaged():
	life -= 1


func _on_box_4_cat_is_eated():
	score += 1


func _on_end_timer_timeout():
	get_tree().quit() 


func _on_timer_timeout():
	game_over()
