module graphics.MainScreen;

import graphics;
import logic.Tile;

/**
 * The main menu screen of the game
 */
class MainScreen : Screen {

    /**
     * Constructs a new MainScreen
     */
    this(Display container) {
        super(container);
        this.components ~= new Map(this.container, new iRectangle(0, 0, 500, 400), generateRandomWorld(21, 16));
    }

    /**
     * Draws the components of the screen
     */
    override void draw() {
        this.container.renderer.clear(Color(150, 125, 50));
    }

    /**
     * What the screen does every frame
     */
    override void onFrame() {

    }

    /**
     * How MainScreen handles an event
     */
    void handleEvent(SDL_Event event) {

    }

}