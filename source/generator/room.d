module generator.room;

import std.typecons;

import generator.entity;

class Room
{    
    private:
        Room north;
        Room east;
        Room south;
        Room west;
        Entity[] entities;
        bool isFinalRoom;

    public this(Room north, Room east, Room south, Room west, Entity[] entities, bool isFinalRoom) {
        this.north = north;
        this.east = east;
        this.south = south;
        this.west = west;
        this.entities = entities;
        this.isFinalRoom = isFinalRoom;
    }

    public Room getNorth() 
    {
        return this.north;
    }

    public Room getEast() 
    {
        return this.east;
    }

    public Room getSouth() 
    {
        return this.south;
    }

    public Room getWest() 
    {
        return this.west;
    }

    public Entity[] getEntities() 
    {
        return this.entities;
    }

    public bool getIsFinalRoom() 
    {
        return this.isFinalRoom;
    }
}