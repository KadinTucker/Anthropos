module anthropos.logic.world.Population;

import anthropos;

/**
 * A class which represents the population on a tile
 * Population has an urban and rural component to it
 * Rural population is represented by a list of rural working industries
 * Urban population is represented by a settlement object
 * Populations also have a culture
 * TO BE DONE: 
 *  - Migration to other populations
 *  - Cultural assimilation
 */
class Population {

    Tile tile; ///The tile on which this population is found
    PrimaryIndustry[] rural; ///The rural population on the tile
    Settlement urban; ///The settlement's population; TODO: implement settlement class 

    /**
     * Gets the rural population
     */
    @property int ruralPopulation() {
        int total;
        foreach(industry; this.rural) {
            total += industry.numEmployed;
        }
        return total;
    }

    /**
     * Gets the urban population
     */
    @property int urbanPopulation() {
        return this.urban.population;
    }

    /**
     * Gets the total population
     */
    @property int population() {
        return this.ruralPopulation + this.urbanPopulation;
    }

}