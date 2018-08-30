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
    Mineral[] naturalResources; ///The natural resources present on the tile
    Plant[] plantsIntroduced; ///All of the plants that have been introduced on the tile

    /**
     * Constructs a new tile
     * Initializes the stockpile's keys
     */
    this() {
        foreach(res; EnumMembers!Resource) {
            this.stockpiles[res] = 0;
        }
    }

    /**
     * Checks for excess workers and tries to spawn an industry
     * Prioritizes farms if there is not enough food,
     * then tries to evenly distribute jobs
     * TODO: make value of industries determinable
     * TODO: implement other industry types
     */
    void spawnIndustry() {
        //Check for each resource in stockpile for harvesters
        //
    }

}