// Variables
boolean mouse = false;
boolean yes = false;
boolean no = false;

void mousePressed() {  // 
  mouse = true;  // Intro click
  
  if (mouseX < width/2 && mouseY > height/2) yes = true;  // Game clicks
  if (mouseX > width/2 && mouseY > height/2) no = true;
}

void mouseReleased() {
  mouse = false;  // Intro click
  
  yes=false;
  no = false;
}
