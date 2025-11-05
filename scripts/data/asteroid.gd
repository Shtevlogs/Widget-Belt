class_name Asteroid

var production : Array[int] = [] # the ids of the widgets being produced here
var production_per_minute : Array[float] = []

func default() -> void:
    production = [0]
    production_per_minute = [10.0]
