// Brendan Chen
// 2021/09/14

void setup() {
  background(255);
  size(800, 800);
}

void draw() {
  rocket(200,400, 1, 45);
  rocket(600,400, 0.5, 270);
  
  face(400,400, #FAF31C);
  
  house(113,192,255, 600,600, 100,100, 30, 60);
}

void face(int x, int y, color c) {
  pushMatrix();
    translate(x,y);
    fill(c);
    stroke(c);
    strokeWeight(1);
    circle(0,0, 100);
    fill(0);
    stroke(0);
    circle(-20,-10, 10);
    circle(20,-10, 10);
    strokeWeight(5);
    noFill();
    arc(0,36, 50,50, radians(200),radians(340));
    
  popMatrix();
}



void house(int r, int g, int b, int x, int y, int w, int h, int ro, int rh) {  // red,green,blue, x,y, width,height, roof overhang, roof height 
  strokeWeight(15);
  fill(r, g, b);
  stroke(r/2, g/2, b/2);
  strokeJoin(ROUND);
  rectMode(CENTER);
  rect(x, y, w, h);  // House
  triangle(x, y-h/2-rh, x-w/2-ro, y-h/2, x+w/2+ro, y-h/2);  // Roof
}

void rocket(int x, int y, float s, float a) {
  pushMatrix();
    strokeWeight(1);
    translate(x,y);  // Transformations
    scale(s);
    rotate(radians(a));
    
    fill(100);
    stroke(100);
    triangle(0, 120, -17, 170, 17, 170);  // engine
  
    fill(150);
    stroke(150);
    beginShape();  // fins
      vertex(-20, 150);
      vertex(-50, 150);
      vertex(-50, 100);
      vertex(-20, 50);
    endShape();
  
    beginShape();
      vertex(20, 150);
      vertex(50, 150);
      vertex(50, 100);
      vertex(20, 50);
    endShape();
  
  
    fill(200);
    stroke(200);
    rectMode(CENTER);
    rect(0, 0, 40, 300);  // body
    triangle(-20, -150, 20, -150, 0, -300);  // nose
  
  popMatrix();  // Resets origin
}
