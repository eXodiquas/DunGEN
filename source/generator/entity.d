module generator.entity;

abstract class Entity
{
    private:
        string name;
        string uuid;
        bool isHostile;

    public this(string name, string uuid, bool isHostile) 
    {
        this.name = name;
        this.uuid = uuid;
        this.isHostile = isHostile;
    }

    protected string getName() 
    {
        return this.name;
    }

    protected string getID() 
    {
        return this.uuid;
    }

    protected bool getIsHostile() 
    {
        return this.isHostile;
    }
}