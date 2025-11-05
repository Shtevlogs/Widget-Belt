class_name WidgetTypes

const BLOCK_SHAPE_POOL : Array[Array] = [
    [
        0,0,0,0,
        0,1,1,0,
        0,1,1,0,
        0,0,0,0
    ],
    [
        0,0,0,0,
        0,0,0,0,
        1,1,1,1,
        0,0,0,0
    ],
    [
        0,0,0,0,
        0,1,1,1,
        0,0,1,0,
        0,0,0,0
    ],
    [
        0,0,0,0,
        1,0,0,0,
        1,1,0,0,
        0,1,0,0
    ],
    [
        0,0,0,0,
        0,1,0,0,
        1,1,1,0,
        0,0,1,0
    ],
    [
        0,0,0,0,
        0,1,1,0,
        0,1,0,0,
        0,1,0,0
    ],
    [
        0,0,0,0,
        0,1,1,0,
        0,0,1,0,
        0,0,1,0
    ],
    [
        0,0,0,0,
        0,1,1,0,
        1,1,1,0,
        0,0,0,0
    ],
    [
        0,1,1,0,
        0,1,0,0,
        0,1,1,0,
        0,0,0,0
    ]
]

var block_shapes = []

func _init() -> void:
    default()

func default() -> void:
    block_shapes = []
    block_shapes.append(_create_shape_of_type(BLOCK_SHAPE_POOL[0], 1))
    block_shapes.append(_create_shape_of_type(BLOCK_SHAPE_POOL[1], 2))
    block_shapes.append(_create_shape_of_type(BLOCK_SHAPE_POOL[2], 3))
    block_shapes.append(_create_shape_of_type(BLOCK_SHAPE_POOL[3], 4))
    block_shapes.append(_create_shape_of_type(BLOCK_SHAPE_POOL[4], 5))
    block_shapes.append(_create_shape_of_type(BLOCK_SHAPE_POOL[5], 6))
    block_shapes.append(_create_shape_of_type(BLOCK_SHAPE_POOL[6], 7))
    block_shapes.append(_create_shape_of_type(BLOCK_SHAPE_POOL[7], 8))
    block_shapes.append(_create_shape_of_type(BLOCK_SHAPE_POOL[8], 9))

func _create_shape_of_type(block_shape: Array, block_type: int) -> Array[int]:
    var to_return : Array[int] = []
    
    var block_width := _get_shape_width(block_shape)
    for x : int in block_width:
        for y : int in block_width:
            to_return.append(int(block_shape[x + y * block_width]) * block_type)
    
    return to_return

func _get_shape_width(block_shape: Array) -> int:
    var size := block_shape.size()
    if size == 16:
        return 4
    elif size == 36:
        return 6
    elif size == 100:
        return 10
    
    assert(false)
    return -1
