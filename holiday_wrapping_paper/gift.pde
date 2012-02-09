
void gift(float x, float y, float gSize, float snowDensity) {
  float gHeight = gSize*random(0.5, 1);
  float gWidth = gSize*random(0.5, 1);

  float gStringX = random(gWidth*0.2, gWidth*0.8);
  float gStringY = random(gHeight*0.2, gHeight*0.8);
  float gStringDiameter = gSize*random(0.08, 0.11);

  boolean bowOnStringX = (floor(random(2)) == 1);

  pushMatrix();
  translate(x - gWidth*0.5, y - gHeight);

  //draw gift box
  noStroke();
  fill(random(0, 100), random(70, 80), random(70, 80));
  rect(0, 0, gWidth, gHeight);

  //draw gift string
  color gStringColor = color(random(0, 100), random(50, 60), random(40, 50));
  fill(gStringColor);

  rect(0, gStringY - gStringDiameter*0.5, gWidth, gStringDiameter);
  rect(gStringX - gStringDiameter*0.5, 0, gStringDiameter, gHeight);

  for (int k = 0; k < snowDensity*0.75; k++) {
    float snowSize = random(gSize*0.2, gSize*0.5);
    float snowPos = random(0.2, 0.85);

    float snowX = map(random(0, 1), 0, 1, 0, gWidth);
    float snowY = map(random(0, 1), 0, 1, gHeight*0.8, gHeight*1.1);
    fill(random(50, 100), 3, random(85, 95));
    ellipse(snowX, snowY, snowSize, snowSize);
  }

  //position bow
  if (floor(random(0, 2)) == 0) {
    translate(gStringX - gStringDiameter*0.5, random(0, gHeight));
  } 
  else {
    translate(random(0, gWidth), gStringY - gStringDiameter*0.5);
  }

  rotate(radians(random(-60, 60)));

  //draw bow
  float bowSize = gSize*random(0.3, 0.7);

  noFill();
  stroke(gStringColor);
  strokeWeight(gStringDiameter);

  ////bows
  bezier(0, 0, 0, -bowSize, -bowSize, 0, 0, 0);
  bezier(0, 0, 0, -bowSize, bowSize, 0, 0, 0);

  ////loose ends  
  bezier(0, 0, 0, random(bowSize*-0.5, 0), random(bowSize*-0.5, 0), 0, random(bowSize*-0.4, bowSize*0.7), random(bowSize*0.4, bowSize*0.7));
  bezier(0, 0, 0, random(bowSize*-0.5, 0), random(bowSize), 0, random(bowSize*0.4, bowSize*0.7), random(bowSize*0.4, bowSize*0.7));

  noStroke();
  noFill();
  popMatrix();
}

