module logic.Tile;

import logic.Population;
import logic.Resource;
import logic.Government;

/**
 * A tile to be found on the map
 */
class Tile {

    double terrain; ///How rough the terrain of the tile is
    double temperature; ///The average temperature of the tile; varies from extreme cold to extreme heat

    Resource resource; ///The resource this tile provides

    Population population; ///The population on this tile, whether city, farm, or otherwise; null if unpopulated 

    Government government; ///The government which controls this tile

    /**
     * The amount a farm yields based on its terrain and climate
     * TODO
     */
    @property double farmYield() {
        return 0;
    }

    /**
     * The amount of movement points it takes to traverse this tile
     * TODO
     */
    @property double movementCost() {
        return 0;
    }

}