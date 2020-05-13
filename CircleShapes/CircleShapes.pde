PImage img;
float tiles;
int corners;
void setup()
{
  frameRate(20);
  size(1000, 1000);  
  pickImg();
  tiles=0;
}
void draw()
{
  fill(0);
  background(0);
  noStroke();
  tiles = (tiles+1)%200;
  float tileSize = width/tiles; 

  translate(tileSize/2, tileSize/2);
  for (int x = 0; x < tiles; x++)
  {
    for (int y = 0; y < tiles; y++)
    {
      corners = (int)random(10)+3;
      color c = img.get(int(x*tileSize), int(y*tileSize));
      float size = map(brightness(c), 0, 255, 0, tileSize/2);
      drawCircle(corners,x*tileSize,y*tileSize,size,c);
    }
  }
  if (tiles==0)
  {
    pickImg();
  }
}

void pickImg()
{
  int i= (int)random(7);
  img = loadImage("PIC"+i+".jpg");
  img.resize(width,height);
}
void drawCircle(int corners, float x, float y, float radius, color c)
{
  fill(c);
  noStroke();
  
  beginShape();
  for (int i=0; i <= corners; i++)
  {
    vertex(
    x+radius*cos(map(i,0,corners,0,TWO_PI)),
    y+radius*sin(map(i,0,corners,0,TWO_PI)));
  }
  endShape();
}
