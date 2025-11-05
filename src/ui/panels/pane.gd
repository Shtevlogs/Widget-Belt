@abstract
class_name Pane
extends Node2D

var open_v2 : Vector2
var closed_v2 : Vector2
var time : float

var tween : Tween = null

func _init(open_position: Vector2, closed_position: Vector2, open_close_time: float) -> void:
    open_v2 = open_position
    closed_v2 = closed_position
    time = open_close_time

func open() -> void:
    if tween : return
    
    tween = self.create_tween()
    await tween.tween_property(self, "position", open_v2, time).finished
    tween = null
    
func close() -> void:
    if tween : return
    
    tween = self.create_tween()
    await tween.tween_property(self, "position", closed_v2, time).finished
    tween = null
