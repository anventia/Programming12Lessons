class Smoke {
  // initial variables //
  float x,y, vx,vy, size;
  int tint, alpha;
  
  
  // construct //
  Smoke() {
    resetParticle();
  }
  
  // movement //
  void show() {  // Draws smoke
    fill(tint,alpha);
    stroke(tint, alpha);
    strokeWeight(0);
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
    size = random(10,20);
    x = random(260,280);
    y = 100+size/2;
    vx = random(-0.2,0.2);
    vy = random(-1,-0.3);
    tint = int(random(70,100));
    alpha = int(random(50, 100));
  }
}
