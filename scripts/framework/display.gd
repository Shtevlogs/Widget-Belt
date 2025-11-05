@abstract
class_name Display
extends Node2D

var _id : int

func data_load(idx: int) -> void:
    _id = idx
    on_data_load(idx)

@abstract
func on_data_load(idx: int) -> void
