module anthropos.logic.economy.Industry;

import anthropos;

/**
 * A single, localized industry
 * Can take multiple forms, and is thus abstract
 * Performs a single job in or from a single tile
 */
abstract class Industry {

    int numEmployed; ///The number of people employed by this industry
    Tile location; ///The tile in which the industry is based

    /**
     * Performs the industry's action
     * Must be defined by industry's children
     */
    abstract void performAction();

}