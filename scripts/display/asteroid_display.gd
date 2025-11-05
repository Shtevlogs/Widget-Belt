class_name AsteroidDisplay
extends Display

const ASTEROID_BUS = preload("uid://pdxsickjrivg")
const RESOURCE_ROW = preload("uid://cfwluqk5hwpka")

const DEFAULT_ROTATION_RATE : float = 0.5

@onready var rotor: Node2D = $Rotor
@onready var resource_rows: Node2D = $ResourceRows

var data : Asteroid
var rotation_rate : float = DEFAULT_ROTATION_RATE

func on_data_load(idx: int) -> void:
    data = Data.asteroids[idx]
    
    for res:Node in resource_rows.get_children():
        res.queue_free()
    #TODO: reuse
    
    for i:int in data.production.size():
        var widget_id := data.production[i]
        var rate := data.production_per_minute[i]
        var new_resource_row := RESOURCE_ROW.instantiate()
        resource_rows.add_child(new_resource_row)
        var production_rate_label := new_resource_row.get_child(0) as Label
        production_rate_label.text = str(snappedf(rate, 0.1)) + "/m"
        var production_widget := new_resource_row.get_child(1) as WidgetDisplay
        production_widget.data_load(widget_id)
    
func _process(delta: float) -> void:
    rotor.rotation = rotor.rotation + rotation_rate * delta

func _on_area_2d_mouse_entered() -> void:
    ASTEROID_BUS.on_asteroid_hover.emit(_id)

func _on_area_2d_mouse_exited() -> void:
    ASTEROID_BUS.on_asteroid_unhover.emit(_id)
