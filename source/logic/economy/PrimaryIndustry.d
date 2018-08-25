module anthropos.logic.economy.PrimaryIndustry;

import anthropos;

/**
 * A primary industry, which acquires goods from nature
 * Can do this given a resource production template (mineral or plant)
 */
abstract class PrimaryIndustry : Industry {

    Resource toProduce; ///The resource to produce
    int yield; ///The yield of resources of the industry
    
    /**
     * Constructs a new primary industry on the given tile
     * Creates the industry with a plant
     * TODO: Make climate structure for defining plant yield, or plant specific lambda
     */
    this(Tile location, PlantType plant) {
        super(location);
        this.toProduce = plant.produced;
    }

    /**
     * Constructs a new primary industry on the given tile
     * Creates the industry with a mineral
     */
    this(Tile location, Mineral mineral) {
        super(location);
        this.toProduce = mineral.produced;
        this.yield = mineral.yield;
    }

}