class Star {
  // instance variables //
  float x,y, vx,vy, size;
  color sFill;
  int selector;
  int speedLimit = 3;
  
  // constructor //
  Star() {
    x = random(0, width);
    y = random(0, height);
    //vy = random(1, 5);
    if (vy >4.9) vy = 10;  // A few faster, larger stars
    if (vy >4.7 && vy < 10) vy = 7;  // ^
    //vx = vy/4;
    size = 100;
    colorMode(HSB);
    sFill = int(random(0,255));
    
    selector = int(random(1,4));  // Randomly selects a side of the screen for square to appear from
    switch (selector) {
      case 1:  // Top
        vx = random(-speedLimit, speedLimit);
        vy = random(speedLimit, speedLimit*1.5);
        break;
      case 2:  // Bottom
        vx = random(-speedLimit, speedLimit);
        vy = random(-speedLimit, -speedLimit*1.5);
        break;
      case 3:  // Left
        vx = random(speedLimit, speedLimit*1.5);
        vy = random(-speedLimit, speedLimit);
        break;
      case 4:  // Right
        vx = random(-speedLimit, -speedLimit*1.5);
        vy = random(-speedLimit, speedLimit);
        break;
    }
  }
  
  // behaviour
  void show() {
    colorMode(HSB);
    fill(sFill,255,255,50);
    square(x,y, size);
  }
  
  void act() {
    x += vx;
    y += vy;
    if (y > height+size/2) y = -size;
    if (x < 0-size/2) x = width+size/2;
    if (x > width+size/2) x = 0-size/2;
  }
}
