class_name BulletEmitter
extends Node2D

@export var bullet_scene: PackedScene
@export var bullet_parent: Node
@export var bullet_velocity: float
@export var bullet_range: Rect2
@export var frequency: float

@onready var bullet_delta := 1.0 / frequency
var acc_delta := 0.0

func create_bullet() -> Node2D:
	var result := bullet_scene.instantiate() as Node2D
	result.position = position
	var angle := randf_range(0.0, 2 * PI)
	result.velocity = bullet_velocity * Vector2(sin(angle), cos(angle))
	result.playarea_aabb = bullet_range
	return result

func _ready():
	pass

func _process(delta):
	acc_delta += delta
	while acc_delta > bullet_delta:
		acc_delta -= bullet_delta
		# generate bullets from the center of this thing
		var newBullet := create_bullet()
		bullet_parent.add_child(newBullet)
