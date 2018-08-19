module anthropos.logic.world.Settlement;

import anthropos;

/**
 * A settlement class
 * Contains people and industries
 * TO BE DONE:
 *  - unrest/unhappiness, immigration
 *  - crime rates
 */
class Settlement {

    Tile location; ///The tile on which the settlement is found
    int population; ///The number of people occupying the settlement
    CityIndustry[] industries; ///The industries based in this settlement

}