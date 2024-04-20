class_name Character
extends Sprite2D

signal increment_graze
signal death

@export var normal_speed: float = 40.0
@export var available_space: Rect2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _unhandled_input(_event):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("forward"):
		position.y -= normal_speed * delta
		#position.y = max(available_space.position.y, position.y)
	elif Input.is_action_pressed("backward"):
		position.y += normal_speed * delta
		#position.y = min(available_space.end.y, position.y)
	if Input.is_action_pressed("left"):
		position.x -= normal_speed * delta
		#position.x = max(available_space.position.x, position.x)
	elif Input.is_action_pressed("right"):
		position.x += normal_speed * delta
		#position.x = min(available_space.end.x, position.x)

func _on_graze_area_area_entered(area: Area2D):
	var bullet := area.owner as BulletScene
	bullet.start_graze()

func _on_graze_area_area_exited(area: Area2D):
	var bullet := area.owner as BulletScene
	if bullet.end_graze() == BulletScene.GRAZE_SUCCESS:
		increment_graze.emit()

func _on_hit_area_area_entered(area: Area2D):
	var bullet := area.owner as BulletScene
	if bullet.bullet_hit() == BulletScene.HIT_SUCCESS:
		death.emit()
