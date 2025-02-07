class_name PipeObject
extends Node2D

signal player_scored
signal player_death

var move_speed = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if position.x <= -350:
		queue_free()
		return
		
	position.x -= move_speed * delta
		
	pass


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body is Player:
		player_scored.emit()
	


func _on_top_body_entered(body: Node2D) -> void:
	if body is Player:
		player_death.emit()


func _on_bottom_body_entered(body: Node2D) -> void:
	if body is Player:
		player_death.emit()
