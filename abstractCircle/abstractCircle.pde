void setup()
{
  size(1000,1000);
}

void draw()
{
  fill(0);
  drawCircle(8, 
  width / 2,
  height / 2,
  30,
  color(0x88,0,0));
}


void drawCircle(int corners, int x, int y, int radius, color c)
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
