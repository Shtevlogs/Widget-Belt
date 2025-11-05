class_name AsteroidTable
extends Node2D

const ROW_WIDTH := 8
const ASTEROID = preload("uid://bk58v53f0p25f")

const SCREEN_OFFSET := Vector2(-512,-256)
const ASTEROID_SPACING := 6.0

func do_load() -> void:
    var asteroid_displays := get_children()
    
    for asteroid_display: AsteroidDisplay in asteroid_displays:
        asteroid_display.queue_free()
    #TODO: reuse rather than free and remake
    
    var asteroids := Data.asteroids
    
    for idx: int in asteroids.size():
        var new_asteroid_display := ASTEROID.instantiate() as AsteroidDisplay
        add_child(new_asteroid_display)
        new_asteroid_display.data_load(idx)

func flow() -> void:
    var asteroid_displays := get_children()
    
    var asteroid_count := asteroid_displays.size()
    
    for idx : int in asteroid_count:
        var asteroid_display : AsteroidDisplay = asteroid_displays[idx]
        asteroid_display.position = SCREEN_OFFSET + GridPositioner.grid_position_to_global(Vector2i(idx%ROW_WIDTH, idx/ROW_WIDTH)) * ASTEROID_SPACING
