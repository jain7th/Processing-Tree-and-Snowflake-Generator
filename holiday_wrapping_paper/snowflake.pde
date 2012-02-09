void snowflake(float x, float y, float sSize) {
  int rLong = round(random(sSize*0.5, sSize));

  int rArmFir = round(rLong*random(0.2, 0.6));
  int rArmSec = round(rArmFir*random(0.3, 0.9));

  pushMatrix();

  translate(x, y);

  noFill();
  stroke(random(50, 100), 3, random(85, 95));
  strokeWeight(random(sSize*0.025, sSize*0.05));

  for (int i = 0; i < 6; i++) {
    rotate(PI/3);

    line(0, 0-rLong, 0, 0);

    //Top Arms Right
    line(0, 0-rArmFir, 0 + round(rArmFir*0.8), 0 - round(rArmFir*1.8));
    line(0, 0-rArmSec, 0 + round(rArmSec*0.8), 0 - round(rArmSec*1.8));

    //Top Arms Left
    line(0, 0-rArmFir, 0 - round(rArmFir*0.8), 0 - round(rArmFir*1.8));
    line(0, 0-rArmSec, 0 - round(rArmSec*0.8), 0 - round(rArmSec*1.8));
  }

  noStroke();

  popMatrix();
}

