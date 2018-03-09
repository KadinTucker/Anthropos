module logic.Industry;

import logic.Government;
import logic.Population;
import logic.Resource;
import logic.Tile;

/**
 * An object which represents a task of producing or moving resources
 */
abstract class Industry : Population {

    Government government; ///The government overseeing this industry (not necessarily owning it)
    City headquartered; ///The city where the industry is based
    int numWorkers; ///The number of workers working directly for this industry

    /**
     * The action the industry performs
     */
    void performAction();

    override int getPopulation() {
        return this.numWorkers;
    }
    
}

/**
 * An industry which produces raw materials
 */
class Harvester : Industry {

    Tile location; ///The location from which the harvester harvests

    override void performAction() {

    }

}