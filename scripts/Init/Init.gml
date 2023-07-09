#macro CELL_SIZE 16

enum CELL_TYPES {
	EMPTY,
	ROOM,
    HALLWAY,
    WALL,
	DOOR_OPEN,
	DOOR_CLOSED,
    COUNT
}

enum DIRECTIONS {
    NORTH,
    WEST,
    SOUTH,
    EAST,
    COUNT
}

randomize();