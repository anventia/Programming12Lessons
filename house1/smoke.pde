class Smoke {
  // initial variables //
  float x,y, vx,vy, size;
  int tint;
  
  
  // construct //
  Smoke() {
    resetParticle();
  }
  
  // movement //
  void show() {  // Draws smoke
    fill(tint);
    stroke(tint);
    strokeWeight(1);
    circle(x,y, size);
  }
  
  void act() {  // Move smoke
    x += vx;
    y += vy;
    if (y < -(size/2)) {
      resetParticle();
    }
  }
  
  void resetParticle() {
    x = random(260,280);
    y = 100;
    vx = random(-0.1,0.1);
    vy = random(-1,-0.3);
    size = random(10,20);
    tint = int(random(100,230));
  }
}
