class Pixel {
  // Create Variables //
  float x,y;
  float size = 15;
  color b;
  
  
  // Constructor //
  Pixel() {
    x = positionX*10;
    y = positionY*10;
    //x = random(0,width);
    //y = random(0,height);
    b = get(int(x), int(y));
  }
  
  
  // Movement //
  void act() {
    size = map(dist(mouseX,mouseY, x,y), 0,100, 0,10);
    if(dist(mouseX,mouseY, x,y) > 100) size = 10;
    //b = map(dist(mouseX,mouseY, x,y), 0,1000, 0,255);
    
  }
  
  
  // Draw //
  void show() {
    rectMode(CENTER);
    noStroke();
    fill(b);
    rect(x,y, size,size);
    //circle(x,y, size);
  }
}
