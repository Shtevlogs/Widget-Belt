class_name FactoryMouseHandler
extends Node2D

const WIDGET_BUS : WidgetBus = preload("uid://bojv6l0cwfojc")

var hovered_widgets : Array[int] = []

func _ready() -> void:
    WIDGET_BUS.on_widget_hover.connect(_on_widget_hover)
    WIDGET_BUS.on_widget_unhover.connect(_on_widget_unhover)

func _input(event: InputEvent) -> void:
    if !(event is InputEventMouseButton): return
    var mouse_button_event := event as InputEventMouseButton
    
    if mouse_button_event.button_index == MOUSE_BUTTON_LEFT && mouse_button_event.pressed:
        _on_widget_mouse_down()

func _process(_delta: float) -> void:
    if hovered_widgets.size() > 0:
        Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
    else:
        Input.set_default_cursor_shape(Input.CURSOR_ARROW)
    
    var selected_widgets := Data.widgets.filter(func(widget): return widget.selected)
    if selected_widgets.size() == 0: return
    
    var xy := Vector2i.ZERO
    
    if Input.is_action_just_pressed("left"):
        xy.x -= 1
    if Input.is_action_just_pressed("right"):
        xy.x += 1
    if Input.is_action_just_pressed("up"):
        xy.y -= 1
    if Input.is_action_just_pressed("down"):
        xy.y += 1
        
    if xy == Vector2i.ZERO: return
    
    for selected_widget in selected_widgets:
        selected_widget.grid_position += xy

func _on_widget_hover(idx: int) -> void:
    if !hovered_widgets.has(idx):
        hovered_widgets.push_back(idx)

func _on_widget_unhover(idx: int) -> void:
    if hovered_widgets.has(idx):
        hovered_widgets.remove_at(hovered_widgets.find(idx))

func _on_widget_mouse_down() -> void:
    for widget:Widget in Data.widgets:
        widget.selected = false
    
    var widget_nearest_center = _nearest_widget_to(get_global_mouse_position())
    
    if widget_nearest_center < 0: return
    
    Data.widgets[widget_nearest_center].selected = true

func _nearest_widget_to(_pos: Vector2) -> int:
    return 0
