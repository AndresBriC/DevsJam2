extends Node2D
class_name HungerComponent

@export var MAX_FULLNESS := 100.0 # Food capacity
var fullness: float
@export var DEPLETION_RATE := 0.5 # Per second

# Fullness thresholds
@export var MATING_THRESHOLD := 0.8 # Percent of max_fullness
@export var EATING_THRESHOLD := 0.5
@export var HUNGER_THRESHOLD := 0.2

# Fullness values, used to only calculate the fullness values once
var MATING_VALUE: float
var EATING_VALUE: float
var HUNGER_VALUE: float

# Called when the node enters the scene tree for the first time.
func _ready():
	fullness = MAX_FULLNESS;
	MATING_VALUE = MAX_FULLNESS * MATING_THRESHOLD
	EATING_VALUE = MAX_FULLNESS * EATING_THRESHOLD
	HUNGER_VALUE = MAX_FULLNESS * HUNGER_THRESHOLD

func hunger_tick():
	fullness -= DEPLETION_RATE
