void setup() {
  size(400, 400);
  stroke(0, 192, 0, 128);
  strokeWeight(1);
  strokeCap(SQUARE);
  
  background(0);
}

void draw() {

  // Partially clear the background with a transparent black rectangle
  fill(0, 0, 0, 32);
  stroke(0, 0, 0, 0);
  rect(0, 0, 400, 400);
  
  // Reset the stroke color
  stroke(0, 192, 255, 128);
  
  int step = 25;
  int startX = 200;
  int startY = 200;
  int currentY = 200;
  int lastY = 200;
  int zigzag = 1;
  int nextStep = 0;

  int angle = random(0, 2 * Math.PI);

  for (int dir = 0; dir < 350; dir += nextStep) {
    nextStep = random(1, step);
    int x = cos()

    line(x, lastY, x + nextStep, currentY);
    lastY = currentY;
    currentY += random(-25, 20) * zigzag;
    zigzag *= -1;
  }
}