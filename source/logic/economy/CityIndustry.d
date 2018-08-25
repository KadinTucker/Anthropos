module anthropos.logic.economy.CityIndustry;

import anthropos;

/**
 * A city-based industry, which does a variety of things
 * TODO: Implement manufacturering, banking, distributing, and transporting
 */
abstract class CityIndustry : Industry {

    Settlement based; ///The settlement in which the industry is based

    /**
     * Constructs a new city industry on the given tile and in its settlement
     */
    this(Tile location) {
        super(location);
        this.based = location.population.urban;
    }

}