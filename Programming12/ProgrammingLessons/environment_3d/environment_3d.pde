// 3D Environment //

// Imports //
import com.jogamp.newt.opengl.GLWindow;

// Vars //
GLWindow window;  // Window

float camX, camY, camZ, focX, focY, focZ, upX, upY, upZ;  // camera 
boolean keyA, keyD, keyW, keyS;  // movement
float camS;  // speed
float camH;  // height above ground
float camAngleV, camAngleH;  // Vertical + Horizontal angles

int[][] map;

PImage stone_bricks;

int blockSize;
int floorSize;

// Setup //
void setup() { 
  size(800,600, P3D);
  textureMode(NORMAL);
  ((PGraphicsOpenGL)g).textureSampling(3);  // Don't blur images when upscaling
  noCursor();
  window = (GLWindow) surface.getNative();
  
  camX = camY = camZ = 0;
  focX = focY = 0; focZ = -1;
  upX = upZ = 0; upY = 1;
  camS = 10;
  camH = 200;
  camAngleH = PI/2;
  
  map = new int[][] {  // 20x20 map
   {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
  };
  
  stone_bricks = loadImage("stone_bricks.png");
  
  blockSize = 100;
  floorSize = 20;
}


// Draw //
void draw() {
  background(#AEDAF0); 
  drawFloor();
  drawWalls();
  controlCamera();
}


// Floor //
void drawFloor() {
  float floorX = -((blockSize*floorSize-1)/2);
  float floorZ = -((blockSize*floorSize-1)/2);
  for(int z = 0; z < floorSize; z++) {
    for(int x = 0; x < floorSize; x++) {
      txCube(floorX,camH,floorZ, blockSize, stone_bricks);
      floorX += blockSize;
    }
    floorZ += blockSize;
    floorX = -((blockSize*floorSize-1)/2);
  }
}


// Walls //
void drawWalls() {
  for(int r = 0; r < floorSize; r++) {
    for(int c = 0; c < floorSize; c++) {
      int block = map[r][c];
      switch(block) {
        case 1:  // Brick wall 
      }
    }
  }
}

// Camera //
void controlCamera() {
  camera(camX,camY,camZ, focX,focY,focZ, upX,upY,upZ);
  
  // Location //
  if(keyA)  {
    camX += cos(camAngleH+PI/2)*camS;
    camZ -= sin(camAngleH+PI/2)*camS; 
  }
  if(keyD) {
    camX -= cos(camAngleH+PI/2)*camS;
    camZ += sin(camAngleH+PI/2)*camS; 
  }
  
  if(keyW) {
    camX += cos(camAngleH)*camS;
    camZ -= sin(camAngleH)*camS; 
  }
  if(keyS) {
    camX -= cos(camAngleH)*camS;
    camZ += sin(camAngleH)*camS; 
  }
  
  
  // Direction //
  focX = camX + cos(camAngleH)*300;
  focY = camY + tan(camAngleV)*300;
  focZ = camZ - sin(camAngleH)*300;
  
  if(focused) {
    window.warpPointer(width/2, height/2);
    camAngleH += -(mouseX - width/2)*0.01;
    camAngleV += (mouseY - height/2)*0.01;
  }
  
  if(camAngleV > PI/2.1) camAngleV = PI/2.1;
  if(camAngleV < -PI/2.1) camAngleV = -PI/2.1;
  
}
