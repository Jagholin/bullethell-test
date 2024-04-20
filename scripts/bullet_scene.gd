class_name BulletScene
extends Sprite2D

@export var velocity: Vector2
@export var playarea_aabb: Rect2

enum { GRAZE_NONE, GRAZE_STARTED, GRAZE_GRAZED, GRAZE_HIT }
enum { GRAZE_FAIL, GRAZE_SUCCESS }
enum { HIT_FAIL, HIT_SUCCESS }
var graze_status:int = GRAZE_NONE

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func destroy_bullet():
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += delta * velocity
	if not playarea_aabb.has_point(position):
		destroy_bullet()

func start_graze():
	if graze_status == GRAZE_NONE:
		graze_status = GRAZE_STARTED

## returns one of the GRAZE_SUCCESS, GRAZE_FAIL
func end_graze() -> int:
	if graze_status == GRAZE_STARTED:
		graze_status = GRAZE_GRAZED
		return GRAZE_SUCCESS
	return GRAZE_FAIL

## returns one of HIT_SUCCESS, HIT_FAIL
func bullet_hit() -> int:
	if graze_status == GRAZE_HIT:
		return HIT_FAIL
	graze_status = GRAZE_HIT
	return HIT_SUCCESS
