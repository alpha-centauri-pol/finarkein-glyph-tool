import processing.svg.*;

PImage img;
PShape[] shapes;
PShape rShape;

color bg = #FFFCF5;

int tilesX = 72;
int tilesY = tilesX;

void setup() {
  size(1080, 1080);
  
  img = loadImage("lock.png");
  img.resize(width, height);
  
  shapes = new PShape[3];
  
  shapes[0] = loadShape("circle.svg");
  shapes[1] = loadShape("cross.svg");
  shapes[2] = loadShape("square.svg");
  
  beginRecord(SVG, "export.svg");
}

void draw() {
  background(bg);
  noStroke();
  
  img.loadPixels();
  float[][] tileBrightness = new float[tilesX][tilesY];
  float minB = 360;
  float maxB = 0;
    
  int tileSize = width / tilesX;
  
  for (int x = 0; x < tilesX; x++) {
    for (int y = 0; y < tilesY; y++) {
      
      color c = img.get(x*tileSize, y*tileSize);
      float b = brightness(c);
     
      tileBrightness[x][y] = b;
      if (b < minB) minB = b;
      if (b > maxB) maxB = b;
    }
  }
  
  for (int x = 0; x < tilesX; x++) {
    for (int y = 0; y < tilesY; y++) {
      
      float relB = map(tileBrightness[x][y], minB, maxB, 0, 100);
      
      if (relB >= 0 && relB < 25){
        shape(shapes[1], x*tileSize, y*tileSize, tileSize, tileSize);
      }
      
      else if (relB > 25 && relB < 45){
        shape(shapes[2], x*tileSize, y*tileSize, tileSize, tileSize);
      }
      
      else if (relB > 50 && relB < 100){
        shape(shapes[0], x*tileSize, y*tileSize, tileSize, tileSize);
      }
    }
  }
  
  endRecord();
}
