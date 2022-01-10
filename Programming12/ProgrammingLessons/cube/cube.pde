// 3D programming! //

float rX, rY;  // rotation

void setup() {
  size(800,800, P3D);
  // ortho();  // orthogonal view
}


void draw() {
  background(255);
  pushMatrix();
    translate(width/2, height/2, 0);
    rotateX(rX);
    rotateY(rY);
    fill(0,20);
    stroke(0);
    strokeWeight(3);
    box(100,100,100);
    
    stroke(255,0,0);  // X
    line(-200,0,0, 200,0,0);
    fill(255,0,0);
    push(); translate(200,0,0); sphere(5); pop();
    
    stroke(0,255,0);  // Y
    line(0,-200,0, 0,200,0);
    fill(0,255,0);
    push(); translate(0,200,0); sphere(5); pop();
    
    stroke(0,0,255);  // Z
    line(0,0,-200, 0,0,200);
    fill(0,0,255);
    push(); translate(0,0,200); sphere(5); pop();
    
  popMatrix();
}

void mouseDragged() {
  rX += (pmouseY - mouseY)*0.01;
  rY += (pmouseX - mouseX)*-0.01;
}
