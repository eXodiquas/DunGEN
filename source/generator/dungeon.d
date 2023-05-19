module generator.dungeon;

import generator.room;
import generator.dungeonconfiguration;

class Dungeon
{
    private:
        string name;
        Room startingRoom;
        DungeonConfiguration configuration;

    public this(string name, DungeonConfiguration configuration)
    {
        this.name = name;
        this.configuration = configuration;
    }

    string getName() const
    {
        return this.name;
    }

    Room getStartingRoom()
    {
        return this.startingRoom;
    }

    DungeonConfiguration getDungeonConfiguration()
    {
        return this.configuration;
    }

    public override string toString() const
    {
        import std.format;
        return format("---------------\nName: %s \nDifficulty: %s \nSize: %s\n---------------\n", 
            this.name, 
            this.configuration.getDifficulty,
            this.configuration.getSize
        );
    }

    // Generation

    public void generateDungeon()
    {
        
    }
}
