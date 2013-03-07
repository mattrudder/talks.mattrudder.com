/// Global variables
float radius = 50.0;
int X, Y;
int nX, nY;
int delay = 16;

void clear() {
  loadPixels();
  for (int i = 0; i < width * height; i++) {
    color argb = pixels[i];
    int a = argb >> 24 & 0xFF;
    int r = argb >> 16 & 0xFF;  // Faster way of getting red(argb)
    int g = argb >> 8 & 0xFF;   // Faster way of getting green(argb)
    int b = argb & 0xFF;        // Faster way of getting blue(argb)

    pixels[i] = color(a / 2, r, g, b);
  }
  updatePixels(); 
}


// Setup the Processing Canvas
void setup(){
  size( 400, 400 );
  frameRate( 24 );
  X = width / 2;
  Y = height / 2;
  nX = X;
  nY = Y;  
  
  clear();
}

// Main draw loop
void draw() {
  
  radius = radius + sin(frameCount / 14) * 8;
  strokeWeight(radius / 10);
  
  // Track circle to new destination
  X += (nX - X) / delay;
  Y += (nY - Y) / delay;
  
  // Fill canvas grey
  clear();
  
  // Set fill-color to blue
  fill( cos(frameCount / 16) * 128, sin(frameCount / 8) * 128, 255);
  
  // Set stroke-color white
  stroke(255); 

  ellipse( X, Y, radius, radius );                  
}