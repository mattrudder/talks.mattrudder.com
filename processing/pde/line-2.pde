void setup() {
  size(400, 400);
  stroke(0, 192, 0, 128);
  strokeWeight(4);
  strokeCap(SQUARE);
}

void draw() {
  background(0);

  int step = 25;
  for (int x = 50; x < 350; x += step) {
    line(x, 200, x + step, 200);
  }
}