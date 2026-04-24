class_name Player

extends RigidBody3D
@onready var spring_arm_3d: SpringArm3D = $SpringArm3D
var mouse := 0.005
#var speed := 0.1
@export var speed: float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.fade_in()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	spring_arm_3d.top_level = true

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		spring_arm_3d.rotation.x -= event.relative.y * mouse
		spring_arm_3d.rotation.y -= event.relative.x * mouse
		#spring_arm_3d.rotation.x = clamp(spring_arm_3d.rotation.x, -PI/2, PI/4)
		spring_arm_3d.rotation.x = clamp(spring_arm_3d.rotation.x, deg_to_rad(-60), PI/4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spring_arm_3d.global_position = global_position

func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	var inputDirection = Vector3(
		Input.get_axis("move_left","move_right"),
		0,
		Input.get_axis("move_up","move_down")
	)
	inputDirection = inputDirection.rotated(Vector3.UP, spring_arm_3d.rotation.y).normalized() * speed
	
	apply_central_impulse(Vector3(inputDirection.x, 0, inputDirection.z))

func kill():
	GameManager.fade_out()
	hide()
	await GameManager.animation_player.animation_finished
	GameManager.score=0
	get_tree().call_deferred("reload_current_scene")
