int numFrames = 69,  counter = 0;
PImage img[] = new PImage[numFrames];
void setup()
{
  frameRate(20);
  size(1000, 1000);  
  loadGif(numFrames,"GIF");
}
void draw()
{
  fill(0);
  background(0xff);
  noStroke();
  float tiles =  (int)mouseX/2;
  float tileSize = width/tiles; 

  translate(tileSize/2, tileSize/2);
  for (int x = 0; x < tiles; x++)
  {
    for (int y = 0; y < tiles; y++)
    {

      color c = img[counter].get(int(x*tileSize), int(y*tileSize));
      float size = map(brightness(c), 0, 255, tileSize, 0);
      fill(red(c),green(c),blue(c),alpha(c));
      ellipse(x*tileSize, y*tileSize, size, size);
    }
  }
  counter = (counter+1)%numFrames;
}
// Class for animating a sequence of GIFs

void loadGif(int numFrames, String name)
{
  for (int i=0; i < numFrames;i++)
  {
    if (i < 10){
    img[i] = loadImage(name+"0"+i+".jpg");
    }
    else
    {
      img[i] = loadImage(name+i+".jpg");
    }
    img[i].resize(width,height);
  }
}
