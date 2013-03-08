void setup() {
  size(400, 400);
  stroke(0, 192, 0, 128);
  strokeWeight(4);
  strokeCap(SQUARE);
  frameRate(2);
}

void draw() {
  background(0);

  int step = 25;
  int direction = 1;
  int y = 200;
  int lastY = 200;
  for (int x = 50; x < 350; x += step) {
    line(x, lastY, x + step, y);
    lastY = y;
    y += random(-25, 20) * direction;
    direction *= -1;
  }
}