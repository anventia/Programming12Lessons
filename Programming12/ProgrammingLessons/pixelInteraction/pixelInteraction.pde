// Mouse Interaction Pixels
// 2021/09/28

Pixel[] pixel;
int count = 7000;
int positionX = 1;
int positionY = 1;
PImage img;

void setup() {
  background(2);
  size(1000,700);
  img = loadImage("background.jpg");
  image(img,0,0, width,height);
  int i = 0;
  pixel = new Pixel[count];
  while(i < count) {pixel[i] = new Pixel(); positionX++; if(positionX > 100) {positionX = 1; positionY++;} i++;}
  
  
}


void draw() {
  //background(255);
  image(img,0,0, width,height);

  int i = 0;
  while(i < count) {pixel[i].show(); pixel[i].act(); i++;}
}
