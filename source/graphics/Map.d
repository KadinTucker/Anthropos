module graphics.components.Map;

import graphics;
import logic.Resource;
import logic.Tile;

immutable int tileSize = 24; ///The rectangular size of each tile; temporary

/**
 * A component which lays out tiles
 */
class Map : Component {

    iRectangle _location; ///The location and dimensions of the map
    Tile[] world; ///The map to be drawn

    /**
     * Constructs a new map in the given display
     */
    this(Display container, iRectangle location, Tile[] world) {
        super(container);
        this.world = world;
        this._location = location;
    }

    override @property iRectangle location() {
        return this._location;
    }

    override @property void location(iRectangle newLocation) {
        this._location = newLocation;
    }

    /**
     * Draws the map to the screen
     */
    override void draw() {
        foreach(tile; this.world) {
            this.container.renderer.fillRect(new iRectangle(this._location.x + tile.location.x * tileSize, 
                    this._location.y + tile.location.y * tileSize, tileSize, tileSize),
                    Color(cast(ubyte) (160 * (1 - tile.temperature * tile.precip)), 
                    cast(ubyte) (160), 
                    cast(ubyte) (100 * (1 - tile.temperature) + 60 * (1 - tile.temperature * tile.precip))));
            if(tile.resource == Resource.RAWOIL) {
                this.container.renderer.copy(new Texture(loadImage(Image.Oil), this.container.renderer), 
                        new iVector(this._location.x + tile.location.x * tileSize, this._location.y + tile.location.y * tileSize));
            }
        }
    }

    /**
     * Handles incoming map events
     */
    void handleEvent(SDL_Event event) {

    }

}