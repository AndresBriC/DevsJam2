extends Camera2D

@onready var dragdrop_component = $DragDropComponent as DragDropComponent

var drag_pos = Vector2.ZERO

func _ready():
	set_process(false)
	
	
func _input(event):
	dragdrop_component.is_dragging(event)
	
	
func zoom():
	if Input.is_action_just_released('wheel_down'):
		set_zoom(get_zoom() - Vector2(0.25, 0.25))
	if Input.is_action_just_released('wheel_up') and get_zoom() > Vector2.ONE:
		set_zoom(get_zoom() + Vector2(0.25, 0.25))


func _process(delta):
	var drag_delta = drag_pos - get_global_mouse_position()
	offset += drag_delta / zoom
	drag_pos = get_global_mouse_position()
	
	
func _physics_process(delta):
	zoom()
	
	
func _on_drag_drop_component_dragging(new_pos):
	drag_pos = new_pos
	set_process(true)
	
	
func _on_drag_drop_component_drag_stopped():
	set_process(false)
	
