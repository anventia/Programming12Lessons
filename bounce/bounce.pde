// Brendan Chen
// 2021/09/13

// Variable Initialization //

int x;
int y;
int xV;
int yV;


void setup() {

  background(255);
  //size(800,800);
  fullScreen();
  
  // Global Variables //
    
  x = width/2;
  y = height/2;
  
  xV = int(random(5, 10));
  yV = int(random(5, 10));
  
}

void draw() {
  // Circle //
  strokeWeight(1);  // Draw
  fill(#829BFC);
  stroke(#829BFC);
  circle(x,y, 50);
  
  x = x + xV;  // Movement
  y = y + yV;
  
  if (y < 0+25 || y > height-25 || dist(x,y, mouseX,mouseY) < 25) {  // Collisions 
    yV = yV*-1; 
  }
  if (x < 0+25 || x > width-25 || dist(x,y, mouseX,mouseY) < 25) {
    xV = xV*-1;
  }
  
  
  // Fade //
  fill(255,255,255, 35);
  stroke(255,255,255, 35);
  rect(0,0, width,height);
  
}
