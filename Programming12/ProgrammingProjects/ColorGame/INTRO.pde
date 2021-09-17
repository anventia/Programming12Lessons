void intro() {
  background(240);  // This will be replaced with an Animated Gif background!
  
  fill(100);  // Temporary text
  textAlign(CENTER);
  textSize(100);
  text("Click anywhere to start", width/2, height/2);
  textSize(30);
  text("Intro screen coming soon", width/2, height/2+50);
  
  if (mouse) mode = GAME;  // Checks for mouse clock to start game
  
}
