module generator.builder;

import std.typecons;

import generator.dungeonconfiguration;
import generator.room;

class Builder
{
    alias Position = Tuple!(int, int);
    
    private:
        uint size;
        uint openDoors;
        Room[Position] map;


    this(DungeonConfiguration dc) 
    {
        this.size = dc.getSize();
        this.openDoors = 4;
        this.map[Position(0, 0)] = new Room(null, null, null, null, [], false);
    }
}