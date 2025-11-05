class_name Game
extends Node2D

#a place for stopgap game code, eventually will be empty

const WIDGET = preload("uid://c3khshi7oa7xi")

@onready var asteroid_table: AsteroidTable = $AsteroidCatalogScreen/AsteroidTable

func _ready() -> void:
    #TODO: actual loading
    var data := Data.new()
    data.default()
    
    for i : int in 10:
        var widget := Widget.new()
        widget.default()
        var blocks : Array = data.widget_types.block_shapes[i]
        widget.blocks = []
        for block in blocks:
            widget.blocks.append(block)
        data.widgets.append(widget)
    
    asteroid_table.do_load()
    await get_tree().process_frame
    asteroid_table.flow()
            
    #var new_widget_display := WIDGET.instantiate() as WidgetDisplay
    #add_child(new_widget_display)
    #new_widget_display.on_data_load(0)


func _on_buy_button_pressed() -> void:
    var asteroid := Asteroid.new()
    asteroid.default()
    asteroid.production = [[0,1,2,3,4,5,6,7,8].pick_random()]
    asteroid.production_per_minute = [1.0 + randf() * 4.0]
    Data.asteroids.append(asteroid)
    asteroid_table.do_load()
    await get_tree().process_frame
    asteroid_table.flow()
