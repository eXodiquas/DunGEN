module generator.dungeonconfiguration;

class DungeonConfiguration
{
    private:
        uint size;
        uint difficulty;

    public this(uint size, uint difficulty) {
        this.size = size;
        this.difficulty = difficulty;
    }

    public uint getSize() const
    {
        return this.size;
    }

    public uint getDifficulty() const
    {
        return this.difficulty;
    }
}