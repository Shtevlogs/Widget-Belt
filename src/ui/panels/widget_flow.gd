class_name WidgetFlow
extends Pane

const OPEN_CLOSE_TIME := 0.55
const OPEN_V2 := Vector2(0,0)
const CLOSED_V2 := Vector2(-1280,0)

func _init() -> void:
    super._init(OPEN_V2, CLOSED_V2, OPEN_CLOSE_TIME)
