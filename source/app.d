module app;

import graphics;

void main() {
	Display display = new Display(800, 600, SDL_WINDOW_SHOWN, 0, "Anthropos", Image.Icon);
	display.screen = new MainScreen(display);
	display.run();
}
