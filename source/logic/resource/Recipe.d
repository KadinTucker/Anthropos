module anthropos.logic.resource.Recipe;

import anthropos;

/**
 * A structure which defines a recipe for a resource
 * Has the reagents and the product, all with their 
 * amounts required/produced
 */
struct Recipe {
    
    Resource[] reagents; ///The resources required to complete the recipe
    int[] reagentAmounts; ///The amount of each resource needed to complete the recipe
    Resource[] products; ///The products that result from the recipe
    int[] productAmounts; ///The amount of each product yielded

}

/**
 * An enumeration of all of the recipes to be found in the game
 */
enum RecipeType: Recipe {
    NULL=Recipe(null, null, null, null),
    IRON_FROM_WOOD=Recipe([Resource.IRONORE, Resource.WOOD], [1, 2], [Resource.IRON], [1])
}