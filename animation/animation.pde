// Brendan Chen
// 2021/09/13

// Variable Initialization //

int x;
int y;

int yV;


void setup() {

  background(255);
  //size(800,800);
  fullScreen();
  
  // Global Variables //
    
  x = width/2;
  y = 0;
  

  yV = -5;
  
}

void draw() {
  // Circle //
  strokeWeight(1);  // Draw
  fill(#829BFC);
  stroke(#829BFC);
  circle(x,y, 50);
  
  y = y+yV;  // Move down
  yV = yV+1;  // Acceleration
  
  if (y > height) {
    y = -25;
    yV = -5;
    x = int(random(0,width));
  }
  
  // Fade //
  fill(255,255,255, 35);
  stroke(255,255,255, 35);
  rect(0,0, width,height);
  
}
