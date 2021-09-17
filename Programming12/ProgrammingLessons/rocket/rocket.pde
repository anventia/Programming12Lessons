size(800,800);
translate(width/2, height/2);




fill(100);
stroke(100);
triangle(0,120, -17,170, 17,170);  // engine

fill(150);
stroke(150);
beginShape();  // fins
  vertex(-20,150);
  vertex(-50,150);
  vertex(-50,100);
  vertex(-20, 50);
endShape();

beginShape();
  vertex(20,150);
  vertex(50,150);
  vertex(50,100);
  vertex(20, 50);
endShape();



fill(255);
stroke(255);
rectMode(CENTER);
rect(0,0, 40,300);  // body
triangle(-20,-150, 20,-150, 0, -300);  // nose
