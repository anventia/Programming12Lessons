// Textured cube //

float rX, rY;
PImage ice, stone_bricks;

void setup() {
  size(800,800, P3D);
  ((PGraphicsOpenGL)g).textureSampling(3);  // Don't blur images when upscaling
  
  ice = loadImage("ice.png");  // Textures I made for my Minecraft Resource Pack!
  stone_bricks = loadImage("stone_bricks.png");
}


void draw() {
  background(255);
  txCube(200, stone_bricks);
}

void txCube(int s, PImage texture) {
  pushMatrix();
    translate(width/2, height/2, 0);
    rotateX(rX);
    rotateY(rY);
    scale(s/2);
    
    noStroke();
    
    beginShape(QUADS);
      texture(texture);
      
      // Top //
      vertex(-1,-1,-1, 0,0);
      vertex( 1,-1,-1, 16,0);
      vertex( 1,-1, 1, 16,16);
      vertex(-1,-1, 1, 0,16);
      
      // Bottom //
      vertex(-1, 1,-1, 0,16);
      vertex( 1, 1,-1, 16,16);
      vertex( 1, 1, 1, 16,0);
      vertex(-1, 1, 1, 0,0);
      
      // Left //
      vertex(-1,-1,-1, 0,0);
      vertex(-1,-1, 1, 16,0);
      vertex(-1, 1, 1, 16,16);
      vertex(-1, 1,-1, 0,16);
      
      // Right //
      vertex( 1,-1,-1, 16,0);
      vertex( 1,-1, 1, 0,0);
      vertex( 1, 1, 1, 0,16);
      vertex( 1, 1,-1, 16,16);
      
      // Back //
      vertex(-1,-1,-1, 16,0);
      vertex(-1, 1,-1, 16,16);
      vertex( 1, 1,-1, 0,16);
      vertex( 1,-1,-1, 0,0);
      
      // Front //
      vertex(-1,-1, 1, 0,0);
      vertex(-1, 1, 1, 0,16);
      vertex( 1, 1, 1, 16,16);
      vertex( 1,-1, 1, 16,0);
    endShape();
    
  popMatrix();
}



void mouseDragged() {
  rX += (pmouseY - mouseY)*0.01;
  rY += (pmouseX - mouseX)*-0.01;
}
