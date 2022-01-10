// 3D programming! //

float rX, rY;  // rotation

void setup() {
  size(800,800, P3D);
}


void draw() {
  background(255);
  pushMatrix();
    translate(width/2, height/2, 0);
    rotateX(rX);
    rotateY(rY);
    fill(0,20);
    strokeWeight(3);
    box(100,100,100);
  popMatrix();
}

void mouseDragged() {
  rX += (pmouseY - mouseY)*0.01;
  rY += (pmouseX - mouseX)*-0.01;
}
