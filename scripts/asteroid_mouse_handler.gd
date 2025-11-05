class_name AsteroidMouseHandler
extends Node2D

const ASTEROID_BUS = preload("uid://pdxsickjrivg")

var hovered_asteroids : Array[int] = []

func _ready() -> void:
    ASTEROID_BUS.on_asteroid_hover.connect(_on_asteroid_hover)
    ASTEROID_BUS.on_asteroid_unhover.connect(_on_asteroid_unhover)

func _process(_delta: float) -> void:
    if hovered_asteroids.size() > 0:
        Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
    else:
        Input.set_default_cursor_shape(Input.CURSOR_ARROW)

func _on_asteroid_hover(idx: int) -> void:
    if !hovered_asteroids.has(idx):
        hovered_asteroids.push_back(idx)

func _on_asteroid_unhover(idx: int) -> void:
    if hovered_asteroids.has(idx):
        hovered_asteroids.remove_at(hovered_asteroids.find(idx))
