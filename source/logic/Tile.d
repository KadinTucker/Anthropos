module logic.Tile;

import logic.Population;
import logic.Resource;
import logic.Government;

import std.math;
import std.random;

/**
 * A struct denoting the location of an object in the world
 */
struct Location {

    int x; ///The x coordinate
    int y; ///The y coordinate

}

immutable int baseFarmYield = 40; ///The base farm yield before modifiers

/**
 * A tile to be found on the map
 */
class Tile {

    Location location; ///The coordinate location of the tile
    double temperature; ///The average temperature of the tile; varies from extreme cold to extreme heat
    double precip; ///How much precipitation the tile receives
    Resource resource; ///The resource this tile provides
    Population population; ///The population on this tile, whether city, farm, or otherwise; null if unpopulated 
    Government government; ///The government which controls this tile

    /**
     * Constructs a new tile at the given location
     */
    this(Location location, double temperature, double precip) {
        this.location = location;
        this.temperature = temperature;
        this.precip = precip;
    }

    /**
     * The amount a farm yields based on its terrain and climate
     * TODO
     */
    @property int farmYield() {
        return baseFarmYield * cast(int)(1 - abs(this.temperature - 0.5) - abs(this.precip - 0.5));
    }

    /**
     * Gets the distance as the crow flies between this tile and another
     */ 
    double directDistance(Tile other) {
        return cast(int) sqrt(cast(double) 
                (abs(this.location.x - other.location.x) + abs(this.location.y - other.location.y)));
    }

    /**
     * Gets the linear distance between two tiles
     */
    int linearDistance(Tile other) {
        return abs(this.location.x - other.location.x) + abs(this.location.y - other.location.y);
    }

}

/**
 * Generates a random world
 */
Tile[] generateRandomWorld(int xlen, int ylen) {
    Tile[] world;
    foreach(x; 0..xlen) {
        foreach(y; 0..ylen) {
            world ~= new Tile(Location(x, y), uniform(0.0, 1.0), uniform(0.0, 1.0));
        }
    }
    return world;
} 