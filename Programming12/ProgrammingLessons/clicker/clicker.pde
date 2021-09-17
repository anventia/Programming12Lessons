// Brendan Chen 
// 2021/09/15


// Varables //
float x,y;

float xV, yV;

float speed = 1;

int size = 200;

int hits = 0;
int misses = 0;
int clicks = 0;
float percentage;
PFont Montserrat;

boolean wKey,aKey,sKey,dKey;

void setup() {
  background(255);
  fullScreen();
  
  // Variables //
  x = width/2;
  y = height/2;
  xV = yV = 0;
  wKey = aKey = sKey = dKey = false;
  Montserrat = createFont("Montserrat-Regular.ttf", 100);
  textFont(Montserrat);
}

void draw() {  
  // Init //  
  fill(255,100);  // Background clear
  stroke(255,100);
  rectMode(CORNER);
  rect(0,0, width,height);
  
  
  // Ball //
  fill(#93C9F7);  // Draw
  stroke(#8AC1F0);
  strokeWeight(10);
  circle(x,y, size);
  
  stroke(#8AC1F0);  // Ball Crosshair
  strokeWeight(5);
  line(0,y, width,y);
  line(x,0, x,height);
  
  if (wKey && y > 0+size/2) yV -= speed;  // Change Velocity
  if (sKey && y < height-size/2) yV += speed;
  if (aKey && x > 0+size/2) xV -= speed;
  if (dKey && x < width-size/2) xV += speed;
  
  x += xV;  // Change Position
  y += yV;
  
  if (x < 0+size/2 || x > width-size/2) xV = xV * -1;
  if (y < 0+size/2 || y > height-size/2) yV = yV * -1;
  
  xV = xV * 0.92;
  yV = yV * 0.92;
  
  // Crosshairs //
  stroke(#F08A8C);  // Mouse
  strokeWeight(5);
  line(0,mouseY, width,mouseY);
  line(mouseX,0, mouseX,height);
  noFill();
  circle(mouseX,mouseY, size*1.5);
  
  // Score // 
  fill(#8AC1F0);  // Misses (Blue)
  textSize(70);
  textAlign(LEFT);
  text("Misses: "+misses, 20,height-20);
  
  fill(#F08A8C);  // Hits (Red)
  text("Hits: "+hits, 20,height-100);
  
  fill(100);  // Clicks
  text("Clicks: "+clicks, 20, height-180);
  
  
  if (clicks > 0) {
    percentage = ((float)hits/clicks)*100;
    text(round(percentage)+"%", 20, height-260);
  } else {
    text("100%", 20,height-260);
  }
}
