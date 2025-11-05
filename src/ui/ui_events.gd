class_name UIEvents
extends Node

## using an event bus would be overkill right now

@onready var widget_flow: Pane = $"../WidgetFlow"
@onready var asteroid_list: Pane = $"../WidgetFlow/AsteroidList"

func _on_open_widget_flow_pressed() -> void:
    widget_flow.open()

func _on_close_widget_flow_pressed() -> void:
    widget_flow.close()

func _on_open_asteroid_list_pressed() -> void:
    asteroid_list.open()

func _on_close_asteroid_list_pressed() -> void:
    asteroid_list.close()
