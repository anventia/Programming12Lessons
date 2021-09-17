// Brendan Chen
// 2021/09/10

Smoke smoke[];
int num;


void setup() {
  background(#9DE4FF);
  size(400,400);
  
  // Smoke //
  num = 60;  // Number of smoke particles
  smoke = new Smoke[num];
  int i = 0;
  while (i < num) {
    smoke[i] = new Smoke();
    i += 1;
  }
}


void draw() {  
  fill(#9DE4FF);
  stroke(#9DE4FF);
  rectMode(CORNER);
  rect(0,0, width,height);
  
  // Grass  //
  fill(#9DFFB3);
  stroke(#9DFFB3);
  strokeWeight(1);
  
  rect(0,350, 400,350);
  
  
  // Smoke //
  int i = 0;
  while (i < num) {
    smoke[i].show();
    smoke[i].act();
    i += 1;
  }
 
 
  // Chimney //
  fill(#A28E78);
  stroke(#816E5A);
  strokeWeight(5);
  
  rectMode(CORNER);
  rect(250,100, 40,60);
  
  
  // Main //
  fill(#A28E78);
  stroke(#A28E78);
  
  rectMode(CENTER);
  rect(200,275, 200,150);  // House
  
  triangle(200,80, 70,200, 330,200);  // Roof
  
 
  // Outlines //
  stroke(#816E5A);
  strokeWeight(5);
  
  line(200,80, 70,200);  // Roof
  line(70,200, 330,200);
  line(330,200, 200,80);
  
  line(100,350, 300,350);  // House
  line(100,200, 100,350);
  line(300,200, 300, 350);
  
  
  // Door //
  rectMode(CENTER);
  fill(#838383);
  rect(200,300, 50,100);
  
  
}
  
  
  
  
  
