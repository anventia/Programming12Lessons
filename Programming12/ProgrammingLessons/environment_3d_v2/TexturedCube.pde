void txCube(float x, float y, float z, int s, PImage texture) {
  pushMatrix();
    translate(x,y,z);
    scale(s/2);  
    noStroke();
    
    beginShape(QUADS);
      texture(texture);
      
      // Top //
      vertex(-1,-1,-1, 0,0);
      vertex( 1,-1,-1, 1,0);
      vertex( 1,-1, 1, 1,1);
      vertex(-1,-1, 1, 0,1);
      
      // Bottom //
      vertex(-1, 1,-1, 0,1);
      vertex( 1, 1,-1, 1,1);
      vertex( 1, 1, 1, 1,0);
      vertex(-1, 1, 1, 0,0);
      
      // Left //
      vertex(-1,-1,-1, 0,0);
      vertex(-1,-1, 1, 1,0);
      vertex(-1, 1, 1, 1,1);
      vertex(-1, 1,-1, 0,1);
      
      // Right //
      vertex( 1,-1,-1, 1,0);
      vertex( 1,-1, 1, 0,0);
      vertex( 1, 1, 1, 0,1);
      vertex( 1, 1,-1, 1,1);
      
      // Back //
      vertex(-1,-1,-1, 1,0);
      vertex(-1, 1,-1, 1,1);
      vertex( 1, 1,-1, 0,1);
      vertex( 1,-1,-1, 0,0);
      
      // Front //
      vertex(-1,-1, 1, 0,0);
      vertex(-1, 1, 1, 0,1);
      vertex( 1, 1, 1, 1,1);
      vertex( 1,-1, 1, 1,0);
    endShape();
    
  popMatrix();
}

/*
void txCube(int s, PImage top, PImage sides, PImage bottom) {
  pushMatrix();
    translate(width/2, height/2, 0);
    scale(s/2);
    
    noStroke();
    
    beginShape(QUADS);
      texture(top);
      
      // Top //
      vertex(-1,-1,-1, 0,0);
      vertex( 1,-1,-1, 1,0);
      vertex( 1,-1, 1, 1,1);
      vertex(-1,-1, 1, 0,1);
    endShape();
    
    beginShape(QUADS);
      texture(bottom);
      // Bottom //
      vertex(-1, 1,-1, 0,1);
      vertex( 1, 1,-1, 1,1);
      vertex( 1, 1, 1, 1,0);
      vertex(-1, 1, 1, 0,0);
    endShape();
    
    beginShape(QUADS);
      texture(sides);
      // Left //
      vertex(-1,-1,-1, 0,0);
      vertex(-1,-1, 1, 1,0);
      vertex(-1, 1, 1, 1,1);
      vertex(-1, 1,-1, 0,1);
      
      // Right //
      vertex( 1,-1,-1, 1,0);
      vertex( 1,-1, 1, 0,0);
      vertex( 1, 1, 1, 0,1);
      vertex( 1, 1,-1, 1,1);
      
      // Back //
      vertex(-1,-1,-1, 1,0);
      vertex(-1, 1,-1, 1,1);
      vertex( 1, 1,-1, 0,1);
      vertex( 1,-1,-1, 0,0);
      
      // Front //
      vertex(-1,-1, 1, 0,0);
      vertex(-1, 1, 1, 0,1);
      vertex( 1, 1, 1, 1,1);
      vertex( 1,-1, 1, 1,0);
    endShape();
    
  popMatrix();
}*/
