extends Node2D
@onready var spawn_point : Node2D = $Pipes/SpawnPoint
@onready var spawn_timer : Timer = $Pipes/SpawnTimer
@onready var pipe_container : Node = $Pipes
@onready var score_label : Label = $ScoreLabel


@export var pipe_node : Node
@export var max_height = -400
@export var min_height = -300
@export var spawn_timer_amount = 2.5


var player_score = 0
var is_paused = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_timer.wait_time = spawn_timer_amount


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if spawn_timer.is_stopped():
		var pipe = preload("res://scenes/pipe.tscn").instantiate()
		pipe.position = spawn_point.position
		pipe.position.y = randi_range(max_height, min_height)
		pipe_container.add_child(pipe)
		pipe.connect("player_scored", _on_pipe_player_scored)
		pipe.connect("player_death", _on_pipe_player_death)
		spawn_timer.start()


func _on_pipe_player_scored() -> void:
	player_score += 1
	score_label.text = "Score: " + str(player_score)


func _on_pipe_player_death() -> void:
	pipe_node.process_mode = Node.PROCESS_MODE_DISABLED
