void setup() {
  size(400, 400);
  stroke(0, 192, 0, 128);
  strokeWeight(1);
  strokeCap(SQUARE);
  
  background(0);
}

void draw() {

  // Partially clear the background with a transparent black rectangle
  fill(0, 0, 0, 16);
  stroke(0, 0, 0, 0);
  rect(0, 0, 400, 400);
  
  // Reset the stroke color
  stroke(0, 192, 255, 128);
  
  int step = 25;
  int currentY = 200;
  int lastY = 200;
  int direction = 1;
  int nextStep = 0;
  for (int x = 50; x < 350; x += nextStep) {
    nextStep = random(1, step);
    line(x, lastY, x + nextStep, currentY);
    lastY = currentY;
    currentY += random(-25, 20) * direction;
    direction *= -1;
  }
}