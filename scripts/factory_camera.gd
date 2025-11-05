class_name FactoryCamera
extends Camera2D

const CAMERA_SPEED : float = 500

func _process(delta: float) -> void:
    var x : float = 0
    var y : float = 0
    if Input.is_action_pressed("cam_left"):
        x -= 1
    if Input.is_action_pressed("cam_right"):
        x += 1
    if Input.is_action_pressed("cam_up"):
        y -= 1
    if Input.is_action_pressed("cam_down"):
        y += 1
        
    if Input.is_action_just_pressed("center"):
        position = Vector2.ZERO
    else:
        position += Vector2(x,y) * delta * CAMERA_SPEED
