module logic.Industry;

import logic.Government;
import logic.Resource;

/**
 * Any industry to be found
 */
interface Industry {

    /**
     * 
     */
    void produce();
    
}

/**
 * An object which produces or moves resources
 * Can be a freighting industry, harvesting, or producing industry
 */
class Harvester : Industry {

    Government government; ///The government which controls this industry
    Resource product;

    void produce() {

    }

}