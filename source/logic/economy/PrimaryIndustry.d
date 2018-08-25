module anthropos.logic.economy.PrimaryIndustry;

import anthropos;

/**
 * A primary industry, which acquires goods from nature
 * TODO: Implement plantations, and mines, maybe more inheriting this class
 */
abstract class PrimaryIndustry : Industry {

    int toProduce; ///The resource to produce; for now an int until there is actually a resource to be produced

}