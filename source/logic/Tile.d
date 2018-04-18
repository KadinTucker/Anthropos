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
 * All tiles have completely random climate and no resources
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

/**
 * Populates tiles with resources
 */
void populateWithResources(Tile[] world) {
    foreach(tile; world) {
        //Oil; used as a test example
        double oilChance = uniform(0.0, 1.0);
        if(getProbabilityFromDecayingDistance(tile, [0, 0], 0.5, 0.05) > oilChance           //Total tundra
                || getProbabilityFromDecayingDistance(tile, [1, 0], 0.5, 0.05) > oilChance   //Total desert
                || getProbabilityFromDecayingDistance(tile, [1, 1], 0.5, 0.05) > oilChance) {//Total rainforest
            tile.resource = Resource.RAWOIL;
        }
    }
}

/**
 * Returns a chance that decays linearly with increasing distance from a point
 * Can return a negative number if the point is outside of the range
 */
double getProbabilityFromDecayingDistance(Tile tile, double[2] optimalPoint, double decayDistance, double optimalChance) {
    return (1 - (sqrt(pow(tile.temperature - optimalPoint[0], 2) + pow(tile.precip * tile.temperature - optimalPoint[1], 2)) / decayDistance)) * optimalChance;
}