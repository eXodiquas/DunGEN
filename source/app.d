import std.stdio;

import generator.dungeon;
import generator.dungeonconfiguration;

void main()
{
	Dungeon d = new Dungeon("Geiler Dungeon", new DungeonConfiguration(5, 1));
	d.writeln;
}
