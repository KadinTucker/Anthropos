module logic.Population;

import logic.Tile;

/**
 * An interface which allows for polymorphism of population types
 */
interface Population {

    /**
     * Gets the number of people living in the population
     */
    int getPopulation();

}

/**
 * A farm found on a tile which produces food
 */
class Farm : Population {

    Tile location; ///The tile on which this farm is located
    int farmers; ///The number of farmers working this farm; can be up to 4

    override int getPopulation() {
        return this.farmers;
    }

}

/**
 * A center of population which is able to produce resources and acts as a trade hub
 */
class City : Population {

    int population; ///The number of people living in the city
    int excessFood; ///The amount of excess food available; each person needs 10 per turn

    override int getPopulation() {
        return this.population;
    }

    /**
     * Incites growth or starvation of the city
     * TODO
     */
    void growth() {
        
    }

}

/**
 * A group of tiles
 * Is a population; can return total population of region
 */
class Region : Population {

    Tile[] regionTiles; ///All of the tiles composing this region

    override int getPopulation() {
        int population;
        foreach(tile; this.regionTiles) {
            population += ((tile.population is null)? 0 : tile.population.getPopulation());
        }
        return population;
    }

}