module app;

import graphics;

void main() {
	Display display = new Display(800, 600, SDL_WINDOW_SHOWN);
	display.screen = new MainScreen(display);
	display.run();
}
