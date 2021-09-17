// Brendan Chen
// 2021/09/16
// Programming 12 Color Game

// Variables //
int mode;  // Mode Framework
final int INTRO    = 0;
final int GAME     = 1;
final int GAMEOVER = 2;

PFont Montserrat;  // Fonts


void setup() {
  background(255);  // Scene initialization
  fullScreen();
  mode = INTRO;  // Start with the Intro mode
  
  Montserrat = createFont("Montserrat-Regular.ttf", 100);  // Initialize Font
  textFont(Montserrat);
}

void draw() {
  switch(mode) {  // Mode Framework  
    case INTRO:     intro();     break;
    case GAME:      game();      break;
    case GAMEOVER:  gameover();  break;
  }
}
