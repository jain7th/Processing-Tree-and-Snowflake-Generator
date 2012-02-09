void setup() {
  size(800, 800);
  colorMode(HSB, 100);
  smooth();
  strokeCap(ROUND);

  frameRate(2);
}

void draw() {
  background(10);
  for (int i = 0; i < 10; i++) {
    snowflake(random(width), random(height*0.8), random(10,30));
  }
  holidaytree(width*0.5, height*0.7, 200);
}

