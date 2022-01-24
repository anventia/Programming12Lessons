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
float fov;

int[][] map;
boolean keyAlt, keyZ;

PImage stone_bricks, oak_planks, smooth_stone, diamond_ore;

int blockSize;
int floorSize;
int wallHeight;

// Setup //
void setup() { 
  size(800,600, P3D);
  textureMode(NORMAL);
  ((PGraphicsOpenGL)g).textureSampling(3);  // Don't blur images when upscaling
  window = (GLWindow) surface.getNative();
  // ortho();  // wtf
  
  camX = camY = camZ = 0;
  focX = focY = 0; focZ = -1;
  upX = upZ = 0; upY = 1;
  camS = 10;
  camH = 200;
  camAngleH = PI/2;
  fov = 90;
  
  map = new int[][] {  // 20x20 map
   {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,1,0,1,1,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,1,0,0,0,0,1,0,0,0,0,0,0,2,0,0,0,1},
   {1,0,0,1,0,0,1,1,1,0,0,0,0,0,2,2,2,0,0,1},
   {1,0,0,1,0,0,0,0,1,0,0,0,0,2,2,2,2,0,0,1},
   {1,0,0,1,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,1},
   {1,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,1},
   {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
  };
  
  stone_bricks = loadImage("stone_bricks.png");
  oak_planks   = loadImage("oak_planks.png");
  smooth_stone = loadImage("smooth_stone.png");
  diamond_ore  = loadImage("diamond_ore.png");
  
  blockSize = 100;
  floorSize = 20;
  wallHeight = 3;
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
  for(int r = 0; r < floorSize; r++) {
    for(int c = 0; c < floorSize; c++) {
      txCube(floorX,camH,floorZ, blockSize, smooth_stone);
      floorX += blockSize;
    }
    floorZ += blockSize;
    floorX = -((blockSize*floorSize-1)/2);
  }
}


// Walls //
void drawWalls() {
  float wallX = -((blockSize*floorSize-1)/2);
  float wallY = camH-blockSize;
  float wallZ = -((blockSize*floorSize-1)/2);
  for(int r = 0; r < floorSize; r++) {
    for(int c = 0; c < floorSize; c++) {
      int block = map[r][c];
      for(int i = 0; i < wallHeight; i++) {
        switch(block) {
          case 1:  // Stone Brick wall 
            txCube(wallX,wallY,wallZ, blockSize, stone_bricks);
            wallY -= blockSize;  // Increase height
            break;
          case 2:  // Diamond ore short wall
            txCube(wallX,wallY,wallZ, blockSize, diamond_ore);
        }
      }
      wallX += blockSize;  // Next column
      wallY = camH-blockSize;  // Reset Y
    }
    wallZ += blockSize;  // Next row
    wallX = -((blockSize*floorSize-1)/2);  // Reset column
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
  
  if(focused && !keyAlt) {
    window.warpPointer(width/2, height/2);  // Keep pointer in center of screen  // (lyndon found this method)
    camAngleH += -(mouseX - width/2)*0.01;  // Measure changes to pointer position
    camAngleV += (mouseY - height/2)*0.01;
    noCursor();  // when holding alt, stop moving camera amd show mouse
  } else cursor(ARROW);
  
  if(camAngleV > PI/2.1) camAngleV = PI/2.1;
  if(camAngleV < -PI/2.1) camAngleV = -PI/2.1;
  
  
  // Zoom //
  if(keyZ) {
    frustum(-20,20, -15,15, 100,2000);
    perspective(radians(fov/5), float(width)/float(height), 10, -1);  
    //ortho();
  } else {
    frustum(-20,20, -15,15, 20,2000);
    perspective(radians(fov), float(width)/float(height), 10, -1);
    //perspective();
  }
  
}
