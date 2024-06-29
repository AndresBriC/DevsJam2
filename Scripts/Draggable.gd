extends Area2D

@onready var dragdrop_component = $DragDropComponent as DragDropComponent

@export var pos_offset = Vector2.ZERO
@export var snap = 16


func _ready():
	set_process(false)


func _process(delta):
	var temp_pos = get_global_mouse_position() - pos_offset
	position = Vector2(snapped(temp_pos.x, snap), snapped(temp_pos.y, snap))
	

func _on_drag_drop_component_dragging(new_pos):
	pos_offset = new_pos - global_position
	set_process(true)


func _on_drag_drop_component_drag_stopped():
	set_process(false)


func _on_input_event(viewport, event, shape_idx):
	dragdrop_component.is_dragging(event)
