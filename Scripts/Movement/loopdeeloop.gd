extends Area2D

var speed = 40
var angular_speed = 0.5

func _process(delta):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta

#func _on_button_pressed():
	#set_process(not is_processing())
#
#func _ready():
	#var timer = get_node("Timer")
	#timer.timeout.connect(_on_timer_timeout)
	#
#func _on_timer_timeout():
	#visible = not visible