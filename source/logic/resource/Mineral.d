module anthropos.logic.resource.Mineral;

import anthropos;

/**
 * A structure which yields resources as minerals
 * Stores the resource produced and its yield
 * Minerals are not enumerated but generated randomly on tiles
 * and to be found
 */
struct Mineral {

    Resource produced;
    int yield; 

}