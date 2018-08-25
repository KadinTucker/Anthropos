module anthropos.logic.resource.Plant;

import anthropos;

/**
 * A structure which defines a plant
 * Has a resource it yields, an ideal climate, and a climate threshhold 
 * of how much deviance it can tolerate
 * TODO: Make a climate struct a thing
 */
struct Plant {

    Resource produced; ///The resource produced by the plant
    double idealTemperature; ///The temperature value ideal for the plant
    double toleranceTemperature; ///The temperature range the plant can tolerate decreasingly
    double idealHumidity; ///The humidity value ideal for the plant
    double toleranceHumidity; ///The humidity range the plant can tolerate
    int yield; ///The amount yielded per unit time at ideal conditions

}

/**
 * An enumeration of plant types; defines what plants
 * can be found in the game
 */
enum PlantType: Plant {
    NULL = Plant(Resource.NULL, 0.0, 0.0, 0.0, 0.0),
    WHEAT = Plant(Resource.FOOD, 0.5, 0.3, 0.4, 0.4),
    FOREST = Plant(Resource.WOOD, 0.5, 0.8, 0.7, 0.4)
}