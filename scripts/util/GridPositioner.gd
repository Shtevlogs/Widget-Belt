class_name GridPositioner

const GRID_WIDTH := 25.6
const GRID_CENTER := Vector2.ZERO

static func grid_position_to_global(grid_position: Vector2i) -> Vector2:
    return GRID_CENTER + Vector2(grid_position.x * GRID_WIDTH, grid_position.y * GRID_WIDTH)
