PImage img;
float tiles;
void setup()
{
  frameRate(10);
  size(1000, 1000);  
  pickImg();
  tiles=0;

}
void draw()
{
  fill(0);
  background(0);
  noStroke();
  tiles = (tiles+1) % 250;
  float tileSize = width/tiles; 

  translate(tileSize/2, tileSize/2);
  for (int x = 0; x < tiles; x++)
  {
    for (int y = 0; y < tiles; y++)
    {

      color c = img.get(int(x*tileSize), int(y*tileSize));
      float size = map(brightness(c), 0, 255, 5, tileSize);
      fill(red(c),green(c),blue(c),alpha(c));
      ellipse(x*tileSize, y*tileSize, size, size);
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
void mouseClicked() 
{
  pickImg();
  tiles=0;
}
