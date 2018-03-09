module logic.Tile;

import logic.Population;
import logic.Resource;
import logic.Government;

import std.math;

immutable int baseFarmYield = 40; ///The base farm yield before modifiers

/**
 * A tile to be found on the map
 */
class Tile {

    double temperature; ///The average temperature of the tile; varies from extreme cold to extreme heat
    double precipitation; ///How much precipitation the tile receives
    Resource resource; ///The resource this tile provides
    Population population; ///The population on this tile, whether city, farm, or otherwise; null if unpopulated 
    Government government; ///The government which controls this tile

    /**
     * The amount a farm yields based on its terrain and climate
     * TODO
     */
    @property int farmYield() {
        return baseFarmYield * cast(int)(1 - abs(this.temperature - 0.5) - abs(this.precipitation - 0.5));
    }

    /**
     * Gets the distance between this tile and another
     * TODO
     */ 
    int distanceTo(Tile other) {
        return 1;
    }

}