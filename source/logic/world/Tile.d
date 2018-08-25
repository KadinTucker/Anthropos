module anthropos.logic.world.Tile;

import anthropos;

import std.traits;

/**
 * A class which contains various sets of data
 * for representation on a map
 * TO BE DONE:
 *  - Government owning the tile
 */
class Tile {

    Population population; ///The population on this tile
    int[Resource] stockpiles; ///How much of each resource is on this tile at the moment

    /**
     * Constructs a new tile
     * Initializes the stockpile's keys
     */
    this() {
        foreach(res; EnumMembers!Resource) {
            this.stockpiles[res] = 0;
        }
    }

}