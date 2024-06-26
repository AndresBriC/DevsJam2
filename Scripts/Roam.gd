extends CharacterBody2D

var movement_speed = 50.0
@export var target: Node2D = null

@onready var navigation_agent_2d = $NavigationAgent2D
@onready var sprite_2d = $Sprite2D

func _ready():
	call_deferred("seeker_setup")

func seeker_setup():
	await get_tree().physics_frame # Wait a physics frame
	if target: # Set the target position
		navigation_agent_2d.target_position = target.global_position

func acquire_target():
	var herbivore_container = get_tree().get_nodes_in_group("herbivore")[0] # This should be changed when adding more herbivores
	var available_herbivores = herbivore_container.get_children()
	
	if !available_herbivores.is_empty():
		var new_target = available_herbivores[0] # Get the first
		target = new_target

func _physics_process(delta):
	if is_instance_valid(target):
		navigation_agent_2d.target_position = target.global_position
	else:
		acquire_target()
		
	if navigation_agent_2d.is_navigation_finished():
		return 
	
	var current_agent_position = global_position
	var next_path_position = navigation_agent_2d.get_next_path_position()
	var new_velocity = current_agent_position.direction_to(next_path_position) * movement_speed
	
	if navigation_agent_2d.avoidance_enabled:
		navigation_agent_2d.set_velocity(new_velocity)
	else:
		_on_navigation_agent_2d_velocity_computed(new_velocity)
	
	move_and_slide()
	# Flip the sprite based on the direction its moving
	sprite_2d.flip_h = false if velocity.x > 0 else true


func _on_navigation_agent_2d_velocity_computed(safe_velocity):
	velocity = safe_velocity
