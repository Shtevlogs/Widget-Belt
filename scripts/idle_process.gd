class_name IdleProcess
extends Node

@onready var label: Label = $"../UI/Label"

class ProductionDescription:
    var production : int
    var rate : float
    var used_rate : float

func _process(delta: float) -> void:
    var production_descriptors : Array[ProductionDescription] = []
    
    for asteroid: Asteroid in Data.asteroids:
        for product_i: int in asteroid.production.size():
            var product := asteroid.production[product_i]
            var rate := asteroid.production_per_minute[product_i]
            var pd := _get_or_create_production_description(product, production_descriptors)
            pd.rate += rate
    
    #TODO: consumption & production
    
    for pd : ProductionDescription in production_descriptors:
        var unused_rate := pd.rate - pd.used_rate
        if unused_rate > 0:
            _sink(pd.production, pd.rate * delta)

    label.text = "$" + str(snappedf(Data.player_state.dollars, 0.01))

func _get_or_create_production_description(production: int, production_descriptors: Array[ProductionDescription]) -> ProductionDescription:
    var found_i := -1
    var last_lt_i := -1
    for i : int in production_descriptors.size():
        var production_in_question := production_descriptors[i].production
        if production_in_question < production:
            last_lt_i = i
        if production_in_question == production:
            found_i = i
            break
    if found_i >= 0:
        return production_descriptors[found_i]
        
    var new_PD := ProductionDescription.new()
    new_PD.production = production
    new_PD.rate = 0.0
        
    if last_lt_i == -1:
        production_descriptors.push_front(new_PD)
    elif last_lt_i == production_descriptors.size() -1:
        production_descriptors.push_back(new_PD)
    else:
        production_descriptors.insert(last_lt_i+1, new_PD)
        
    return new_PD

func _sink(product: int, amount: float) -> void:
    var blocks : Array = Data.widget_types.block_shapes[product]
    var block_count := 0.0
    for blck in blocks:
        if blck > 0:
            block_count += 1
    
    Data.player_state.dollars += block_count * amount * 0.1
