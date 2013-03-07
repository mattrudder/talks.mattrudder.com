void setup()
{
  size(400, 400);
  stroke(255, 192, 0, 128);
  strokeWeight(20);
}

void draw()
{
  int sinMotion = sin(frameCount / 64) * 200;

  background(0);
  
  line(200 + sinMotion, 100, 300, 300);
  line(100, 300, 200 - sinMotion, 100);
}