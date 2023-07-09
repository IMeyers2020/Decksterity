function DungeonRoom(_x1, _y1, _x2, _y2, _dungeonType = DungeonTypes.MINION) constructor {
 
    // Top left corner coordinates
    x1 = _x1;
    y1 = _y1;
    // Bottom right corner coordinates
    x2 = _x2;
    y2 = _y2;
	
	dungeonType = _dungeonType;
 
    // Calculate room's width and height
    width = x2 - x1 + 1;
    height = y2 - y1 + 1;
}

enum DungeonTypes {
	SPAWN = 0,
	MINION = 1,
	SHOP = 2,
	BOSS = 3,
	DUNGEON_TYPE_COUNT = 4
}