module logic.Industry;

import logic.Government;
import logic.Population;
import logic.Resource;
import logic.Tile;

/**
 * An object which represents a task of producing or moving resources
 */
abstract class Industry : Population {

    int numWorkers; ///The number of workers working directly for this industry
    int maxWorkers; ///The working capacity for this industry

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

    /**
     * Performs the harvest; TODO
     */
    override void performAction() {
        
    }

}

/**
 * An industry which converst raw materials into various other materials
 */
class Manufacturer : Industry {

    City location; ///Manufacturers are based in cities; the city in which this one is based
    Resource toProduce; ///The resource to be produced by the manufacturer

    override void performAction() {

    }

}

/**
 * An industry which serves to move resources from one location to another
 */
class Transporter : Industry {

    City[2] movesBetween; ///The cities between which the transporter moves resources

    override void performAction() {

    }

}

/**
 * An industry which markets and distributes resources 
 */
class Distributor : Industry {

    City location; ///The city in which the distributor distributes

    override void performAction() {
        
    }

}