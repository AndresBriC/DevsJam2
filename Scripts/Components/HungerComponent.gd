extends Node2D
class_name HungerComponent

@export var MAX_FULLNESS := 100.0 # Food capacity
var fullness: float
@export var DEPLETION_RATE := 0.5 # Per second

# Fullness thresholds
@export var MATING_THRESHOLD := 0.8 # Percent of max_fullness
@export var EATING_THRESHOLD := 0.5
@export var HUNGER_THRESHOLD := 0.2

# Called when the node enters the scene tree for the first time.
func _ready():
	fullness = MAX_FULLNESS;

func hunger_tick():
	fullness -= DEPLETION_RATE
