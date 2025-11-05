class_name Widget

var blocks : Array[int] = []

func default() -> void:
    blocks = []
    for block : int in WidgetTypes.BLOCK_SHAPE_POOL[0]:
        blocks.append(block)
