extends Node
class_name DragDropComponent

signal dragging(new_pos)
signal drag_stopped

#var is_dragging = false
#@export var pos_offset: Vector2
#@export var snap_step: float

func is_dragging(event: InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				emit_signal("dragging", event.position)
			elif not event.pressed:
				emit_signal("drag_stopped")
			
# Called when the node enters the scene tree for the first time.
#func _ready():
	#pos_offset = Vector2(0,0)
	#snap_step = 0 # Set to 16 for default grid snap

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	## Set sprite position to mouse position with offset
	#if is_dragging:
		#var curr_pos = get_global_mouse_position() - pos_offset
		## Snap to position
		#position = Vector2(snapped(curr_pos.x, snap_step), snapped(curr_pos.y, snap_step))
		##print_debug("dragging")


#func _on_button_button_down():
	## Set offset mouse position while dragging
	#is_dragging = true
	#dragging.emit(is_dragging)
	## Set above layers
	#z_index += 1
	#pos_offset = get_global_mouse_position() - global_position
#
#
#func _on_button_button_up():
	## Stop drag offset
	#is_dragging = false
	#dragging.emit(is_dragging)
	## Set to previous layer
	#z_index -= 1
