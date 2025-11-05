class_name WidgetDisplay
extends Display

const WIDGET_BUS : WidgetBus = preload("uid://bojv6l0cwfojc")

const SNAP_SPEED : float = 20.0

@onready var highlight: Sprite2D = $Highlight
@onready var blocks: Sprite2D = $Blocks

var data : Widget
var center_offset := Vector2.ZERO

func on_data_load(idx: int) -> void:
    data = Data.widgets[idx]
    _setup_blocks()

func _setup_blocks() -> void:
    var blocks_material := blocks.material.duplicate() as ShaderMaterial
    blocks.material = blocks_material
    var full_blocks := _make_full_blocks(data.blocks)
    var center := _get_center_from_blocks(full_blocks)
    blocks_material.set_shader_parameter("blocks", full_blocks)
    blocks.position = Vector2(128.0, 128.0) - center * 25.6 - Vector2(10.0, 10.0)

func _get_center_from_blocks(source: Array[int]) -> Vector2:
    var sum := Vector2.ZERO
    var count := 0.0
    
    for x:int in 10:
        for y:int in 10:
            var i := x + y * 10
            if source[i] == 0:
                continue
            count += 1
            sum += Vector2(x,y)
    
    return sum / count
             

func _make_full_blocks(source: Array[int]) -> PackedInt32Array:
    var to_return : Array[int] = []
    
    var src_width := 0
    if source.size() == 16:
        src_width = 4
    elif source.size() == 36:
        src_width = 6
    elif source.size() == 100:
        src_width = 10
    else:
        assert(false);
    
    for y in 10:
        for x in 10:
            if x >= src_width || y >= src_width:
                to_return.append(0)
            else:
                var src_i := x + y * src_width
                to_return.append(source[src_i])
    
    return to_return


func _on_area_2d_mouse_shape_entered(_shape_idx: int) -> void:
    WIDGET_BUS.on_widget_hover.emit(_id)


func _on_area_2d_mouse_shape_exited(_shape_idx: int) -> void:
    WIDGET_BUS.on_widget_unhover.emit(_id)
