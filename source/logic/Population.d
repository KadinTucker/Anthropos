module logic.Population;

import logic.Industry;
import logic.Resource;
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
    City influencedBy; ///The city to which this farm sends extra food
    int farmers; ///The number of farmers working this farm; can be up to 4

    override int getPopulation() {
        return this.farmers;
    }

    /**
     * Gets the amount of food that is produced by this farm
     */
    int getFoodOutput() {
        return ((this.farmers * this.location.farmYield - 2 * 
                this.location.directDistance(this.influencedBy.location) > 0)? 
                cast(int) (this.farmers * this.location.farmYield - 2 * 
                this.location.directDistance(this.influencedBy.location)) : 0);
    }

}

/**
 * A center of population which is able to produce resources and acts as a trade hub
 */
class City : Population {

    Tile location; ///The tile on which this city is located
    Region influence; ///The surrounding region of the city which the city owns and which supplies raw materials
    Industry[] industry; ///The industries based in this city
    int[Resource] resources; ///The resource stock of the city
    int population; ///The number of people living in the city
    int excessFood; ///The amount of excess food available

    override int getPopulation() {
        return this.population;
    }

    /**
     * Incites natural growth or starvation of the city
     */
    void naturalGrowth() {
        this.excessFood += this.influence.getTotalFarmYield();
        this.excessFood -= 10 * this.population;
        while(this.excessFood < 0) {
            this.population -= 1;
            this.excessFood += 100;
        }
        while(this.excessFood / 100 > 0) {
            this.population += 1;
            this.excessFood -= 100;
        }
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

    int getTotalFarmYield() {
        int food;
        foreach(tile; this.regionTiles) {
            food += (cast(Farm) tile.population)? (cast(Farm) tile.population).getFoodOutput() : 0;
        }
        return food;
    }

}