module anthropos.logic.resource.Resource;

import anthropos;

import std.traits;

/**
 * An enumeration of every existing resource in the game
 * TODO: Add resource attributes?
 */
enum Resource {
    NULL=0,
    FOOD=1,
    IRONORE=2,
    WOOD=3,
    IRON=4
}