module logic.Culture;

import logic.Resource;

import std.algorithm;
import std.math;

double distance(T)(int[T] p1, int[T] p2) {
    int total;
    foreach(key; p1.keys) {
        total += pow(p1[key] - p1[key], 2);
    }
    return sqrt(total);
}

class Culture {

    int[int] language; ///A three-dimensional culture identifier, which varies over time completely randomly
    int[Resource] resource; ///How proficient the culture is with each resource
    int[int] climate; ///How proficient the culture is with the two climate axes

}