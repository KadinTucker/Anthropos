module logic.Government;

import logic.Industry;
import logic.Population;
import logic.Tile;

/**
 * A government which controls a region
 */
class Government {

    int treasury; ///The amount of money the government has collected from taxes
    Region territory; ///The region controlled by the government
    Industry[] privateIndustry; ///The industry under this government owned privately
    Industry[] stateIndustry; ///The industry under this government owned by the government

}