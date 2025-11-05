class_name Data

static var widget_types : WidgetTypes
static var player_state : PlayerState
static var widgets : Array[Widget] = []
static var asteroids : Array[Asteroid] = []

func default() -> void:
    widget_types = WidgetTypes.new()
    player_state = PlayerState.new()
    widgets = []
    asteroids = []
    
    widget_types.default()
    player_state.default()
