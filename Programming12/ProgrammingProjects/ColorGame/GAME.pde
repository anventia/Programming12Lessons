void game() {
  background(240);
  
  fill(100);  // Dividing lines
  stroke(100);
  strokeWeight(20);
  line(width/2,height/2, width/2,height);
  line(0,height/2, width,height/2);  
  
  textSize(100);  // Yes / No text
  
  if (yes) fill(#90FF9C); else fill(100);  // Highlight
  strokeWeight(20);
  text("YES", width/4, height-170);
  strokeJoin(ROUND);  // Arrow indicators
  strokeWeight(10);
  triangle(width/2-109,height-200, width/2-40,height-240, width/2-40,height-160);  // Left
  
  if (no) fill(#FF9090); else fill(100);  // Highlight
  strokeWeight(20);
  text("NO", width/4*3, height-170);
  strokeJoin(ROUND);  // Arrow indicators
  strokeWeight(10);
  triangle(width/2+109,height-200, width/2+40,height-240, width/2+40,height-160);  // Right
}
