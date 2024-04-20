extends ColorRect

@onready var deaths_label: Label = $DeathsLabel
@onready var graze_label: Label = $GrazeLabel
@onready var stats_label: Label = $StatsLabel
@onready var game_view: ColorRect = $GameView
@onready var character: Character = $GameView/Character

var deaths_counter: int = 0
var graze_counter: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	deaths_label.text = str(deaths_counter)
	graze_label.text = str(graze_counter)
	stats_label.text = "FPS: {0}
		Process time: {1}
		Node count: {2}
		Object count: {3}".format([Performance.get_monitor(Performance.TIME_FPS), 
		Performance.get_monitor(Performance.TIME_PROCESS),
		Performance.get_monitor(Performance.OBJECT_NODE_COUNT),
		Performance.get_monitor(Performance.OBJECT_COUNT)])

func _on_character_death():
	deaths_counter += 1

func _on_character_increment_graze():
	graze_counter += 1
