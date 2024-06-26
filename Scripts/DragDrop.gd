extends Sprite2D

var is_dragging = false
var pos_offset = Vector2(0,0)
var snap_step = 0 # Set to 16 for default grid snap

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Set sprite position to mouse position with offset
	if is_dragging:
		var curr_pos = get_global_mouse_position() - pos_offset
		# Snap to position
		position = Vector2(snapped(curr_pos.x, snap_step), snapped(curr_pos.y, snap_step))
		#print_debug("dragging")


func _on_button_button_down():
	# Set offset mouse position while dragging
	is_dragging = true
	# Set above layers
	z_index += 1
	pos_offset = get_global_mouse_position() - global_position


func _on_button_button_up():
	# Stop drag offset
	is_dragging = false
	# Set to previous layer
	z_index -= 1
